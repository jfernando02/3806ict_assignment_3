#include <ros/ros.h>
#include "assignment_3/UpdateGrid.h"
#include "assignment_3/Sensor.h"
#include "communal_defines.cpp"
#include <std_msgs/String.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int32MultiArray.h>
#include <std_msgs/MultiArrayDimension.h>
#include <vector>
#include <random>
#include <fstream>
#include <queue>
#include <string>
#include <utility>

#define GAZEBO_SIMULATION_RATE 3 // how many moves per second will that will be processed/simulated

// boolean expects sub_x and sub_y to determine if sub is at home position
#define SubIsHome(sub_x, sub_y) (sub_x == (SUB_START_X||SUB_START_X2) && sub_y == SUB_START_Y||SUB_START_Y2)
// path names, used to keep track of which path is currently being executed
#define SURVEY_AREA 0
#define COLLECT_SURVIVORS 1
#define GO_HOME 2

// global variable for whenever the home directory is needed
std::string homeDir = getenv("HOME");
// path to the PAT executable
#define PAT_EXE_DIR homeDir + "/Desktop/MONO-PAT-v3.6.0/PAT3.Console.exe"
// path to the explore path csp file for PAT
#define PAT_PATH_CSP_EXPLORE_DIR homeDir + "/catkin_ws/src/3806ict_assignment_3/pat/explore.csp"
// path to the return home path csp file for PAT
#define PAT_PATH_CSP_HOME_DIR homeDir + "/catkin_ws/src/3806ict_assignment_3/pat/return_home.csp"
// path to the collect survivors path csp file for PAT
#define PAT_PATH_CSP_COLLECT_SURVIVORS_DIR homeDir + "/catkin_ws/src/3806ict_assignment_3/pat/collect_survivors.csp"
// path to the output file generated by PAT
#define PAT_OUTPUT_DIR homeDir + "/catkin_ws/src/3806ict_assignment_3/pat/pat_output.txt"
// path to world file generated by robot before calling PAT
#define PAT_WORLD_DIR homeDir + "/catkin_ws/src/3806ict_assignment_3/pat/world.csp"
// timeout duration for BFS searches
#define MAX_BFS_TIME 10

// represents a single sub, its position, move queue, next move, current path, and number of survivors on board
class Sub{
	public:
		int sub_x;
		int sub_y;
		std::queue<std::string> q;
		std::string next_move;
		int currentPath;
		int id;
};

// cmd to execute PAT using the explore path
std::string PAT_CMD_EXPLORE = "mono " + PAT_EXE_DIR + " " + PAT_PATH_CSP_EXPLORE_DIR + " " + PAT_OUTPUT_DIR;
// cmd to execute PAT using the go home path with the BFS engine
std::string PAT_CMD_GO_HOME_BFS = "timeout " + std::to_string(MAX_BFS_TIME) + "s mono " + PAT_EXE_DIR + " -engine 1 " + PAT_PATH_CSP_HOME_DIR + " " + PAT_OUTPUT_DIR;
// cmd to execute PAT using the go home path with the DFS engine
std::string PAT_CMD_GO_HOME_DFS = "mono " + PAT_EXE_DIR + " -engine 1 " + PAT_PATH_CSP_HOME_DIR + " " + PAT_OUTPUT_DIR;
// cmd to execute PAT using the collect survivors path with the BFS engine
std::string PAT_CMD_COLLECT_SURVIVORS_BFS = "timeout " + std::to_string(MAX_BFS_TIME) + "s mono " + PAT_EXE_DIR + " -engine 1 " + PAT_PATH_CSP_COLLECT_SURVIVORS_DIR + " " + PAT_OUTPUT_DIR;
// cmd to execute PAT using the collect survivors path with the DFS engine
std::string PAT_CMD_COLLECT_SURVIVORS_DFS = "mono " + PAT_EXE_DIR + " " + PAT_PATH_CSP_COLLECT_SURVIVORS_DIR + " " + PAT_OUTPUT_DIR;

// -- function declarations --
// takes the message given by the survivor sensors and updates the robot's internal representation (curr_world)
// with SURVIVOR where they are detected. Returns the number of new/unique survivors that have been detected,
// so that survivors are not double counted.
int detect_survivors(assignment_3::Sensor &survivor_srv, int (&curr_world)[BOARD_H][BOARD_W], Sub&sub);
// returns the new coordinates of the robot after it executes the command given by move.
// e.g. (0, 0) & 'moveRight' -> (0, 1)
std::pair<int, int> update_position(std::string &move, int &x, int &y);
// extracts the directions from pat_output.txt and updates the queue with the new moveset.
void update_directions(Sub&sub);
// randomly generates a world with SURVIVOR_COUNT survivors
// expects to be given a 2D array to fill
void generate_world(int (&world)[BOARD_H][BOARD_W]);
// takes the current robot's representation of the world and generates world.csp so that PAT
// has access to the most current version of the environment.
void generate_known_world(int (&world)[BOARD_H][BOARD_W], Sub&sub);
// translates the current world from a 2D vector into a 1D vector
std::vector<int> translate_world(int (&world)[BOARD_H][BOARD_W]);
// utilises generate_known_world & update_directions to ask PAT for the new moveset from the robot's current
// position and understanding of its environment. uses the path provided by currentPath. BFS is used for when
// required path is to go home or collect survivors, with a time limit given by MAX_BFS_TIME. If time is reached,
// DFS version of path is requested (absence of -engine 1 in cmd)
void regenerate_moves(int (&current_world)[BOARD_H][BOARD_W], Sub&sub);
// updates the true world generated by generate_world and the robot's current understanding of the world
// given by current_world by updating visited/sub positions.
void execute_move(int (&current_world)[BOARD_H][BOARD_W], int (&true_world)[BOARD_H][BOARD_W], Sub&sub, std::pair<int, int> &new_coords);
// initialises a Int32MultiArray to be used in the updateGrid srv in order to communicate the updated
// world between the two nodes over the update_grid service
std_msgs::Int32MultiArray createGrid(int (&true_world)[BOARD_H][BOARD_W]);

ros::ServiceClient gridClient;
ros::ServiceClient survivorSensorClient;
assignment_3::UpdateGrid grid_srv;
assignment_3::Sensor survivor_srv;
std_msgs::Int32MultiArray true_grid;
int true_world[BOARD_H][BOARD_W];

int perform_move(Sub&sub, int&survivors_saved, int(&current_world)[8][8], int&survivors_seen);

int main(int argc, char *argv[])
{
	// initialise ros, services, and grid
	ros::init(argc, argv, "testing");
	ros::NodeHandle n;
	gridClient = n.serviceClient<assignment_3::UpdateGrid>("/update_grid");
	survivorSensorClient = n.serviceClient<assignment_3::Sensor>("/survivor_sensor");

	int survivors_saved = 0;
	int survivors_seen = 0;
	int current_world[BOARD_H][BOARD_W];
	// initialise current_world to EMPTY
	for (int i = 0; i < BOARD_H; i++)
		for (int j = 0; j < BOARD_W; j++)
			current_world[i][j] = EMPTY;
	// current world position is visited
	current_world[SUB_START_X][SUB_START_Y] = VISITED;
	current_world[SUB_START_X2][SUB_START_Y2] = VISITED;
	int sub_x = SUB_START_X;
	int sub_y = SUB_START_Y;
	int sub_x2 = SUB_START_X2;
	int sub_y2 = SUB_START_Y2;
	int currentPath = SURVEY_AREA;
	int currentPath2 = SURVEY_AREA;

	//Create subs
	Sub sub;
	sub.sub_x=sub_x;
	sub.sub_y=sub_y;
	sub.currentPath=currentPath;
	sub.id=1;

	Sub sub2;
	sub2.sub_x=sub_x;
	sub2.sub_y=sub_y;
	sub2.currentPath=currentPath;
	sub2.id=2;

	std::list<Sub> subs = {sub, sub2};

	// randomly generate a new world
	generate_world(true_world);

	// transfer the data from int array to std_msgs::Int32MultiArray to be sent via service
	true_grid = createGrid(true_world);
	grid_srv.request.grid = true_grid;

	// send the true world to be modelled by gazebo
	if (!gridClient.call(grid_srv))
	{
		ROS_ERROR("Failed to call update_grid service");
		return EXIT_FAILURE;
	}

	// initise the sensor ranges
	survivor_srv.request.sensorRange = SURVIVOR_DETECTION_RANGE;
	// extract information from sensors at starting position
	if (!survivorSensorClient.call(survivor_srv))
	{
		ROS_ERROR("Failed to call sensor services");
		return EXIT_FAILURE;
	}

	// update our current world with any detected survivors
	for (Sub& submarine : subs){
		int newSurvivorsDetected = detect_survivors(survivor_srv, current_world, submarine);
		if (newSurvivorsDetected)
		{
			// detected a survivor, change our planning to pick them up ASAP
			ROS_INFO("New survivor(s) detected!");
			survivors_seen += newSurvivorsDetected;
			submarine.currentPath = COLLECT_SURVIVORS; // attempt to pick up the any survivors around us if space permits
		}
		// regenerate the moveset with the current path
		regenerate_moves(current_world, submarine);
	}

	// initialise the rate which controls the looping speed
	ros::Rate rate(GAZEBO_SIMULATION_RATE);

	// continue looping while ros is ready to process commands
	while (ros::ok())
	{
		ROS_INFO("-- Start of move cycle --");
		for (Sub& submarine : subs){
			perform_move(submarine, survivors_saved, current_world, survivors_seen);
		}
		ROS_INFO("-- End of move cycle --\n");
		rate.sleep(); // sleep for remaining time in cycle
		ros::spinOnce();
	}
}

int perform_move(Sub&sub, int&survivors_saved, int(&current_world)[BOARD_H][BOARD_W], int&survivors_seen){
		// there are no moves left to extract
		if (sub.q.empty())
		{
			// robot has collected all survivors (either on board or already safe)
			if ((survivors_saved) == SURVIVOR_COUNT)
			{
				// robot is currently home, which means the mission is complete
				if (SubIsHome(sub.sub_x, sub.sub_y))
				{
					ROS_INFO("Mission successful!\nFinal internal representation of environment:");
					for (int i = 0; i < BOARD_H; i++)
					{
						for (int j = 0; j < BOARD_W; j++)
						{
							if (current_world[i][j] != VISITED)
								std::cout << " ";
							std::cout << current_world[i][j] << " ";
						}
						std::cout << std::endl;
					}
					return EXIT_SUCCESS;
				}
				else // saved all survivors, but not home yet
					sub.currentPath=GO_HOME;
			}
			else
			{
				// still people left to be saved
				ROS_INFO("We've run out of moves, but there's still people left to be saved!");
				// survivor locations are known if robot has seen more than it's saved
				if (survivors_seen > survivors_saved)
					sub.currentPath = COLLECT_SURVIVORS; // need a strategy to save those people
				else											// unaware of survivor locations, need to explore
					sub.currentPath = SURVEY_AREA;
			}
			// regenerate moveset with current path
			regenerate_moves(current_world, sub);
		}
		// retrieve next move and remove it from queue
		sub.next_move = std::string(sub.q.front());
		sub.q.pop();
		ROS_INFO("Next move is: %s", sub.next_move.c_str());

		// generate new coordinates from move
		std::pair<int, int> new_coords = update_position(sub.next_move, sub.sub_x, sub.sub_y);
		int new_x = new_coords.first;
		int new_y = new_coords.second;

		// checking all conditions which would prevent us from being able to move

		// if we're going to move into a survivor, it was
		// planned/intentional, so we are safe to pick them up
		if (current_world[new_x][new_y] == SURVIVOR)
		{
			ROS_INFO("About to identify a point of interest");
			survivors_saved++;
			std::cout << "Now have " << survivors_saved << " points of interest located" << std::endl;
		}

		// updating true and internal representations
		execute_move(current_world, true_world, sub, new_coords);

		// pushing the changes to gazebo
		// translate world to vector for multiarray
		true_grid.data = translate_world(true_world);
		grid_srv.request.grid = true_grid;

		// send the true world to be modelled by gazebo
		if (!gridClient.call(grid_srv))
		{
			ROS_ERROR("Failed to call update_grid service");
			return EXIT_FAILURE;
		}

		// now we are at the new position in gazebo, we can update our own positions
		sub.sub_x = new_x;
		sub.sub_y = new_y;

		// call the sensors and extract information
		if (!survivorSensorClient.call(survivor_srv))
		{
			ROS_ERROR("Failed to call sensor services");
			return EXIT_FAILURE;
		}

		int newSurvivorsDetected = detect_survivors(survivor_srv, current_world, sub);

		if (newSurvivorsDetected)
		{
			// detected a survivor, change our planning to pick them up ASAP
			ROS_INFO("New point of interest(s) detected!");
			survivors_seen += newSurvivorsDetected;
			sub.currentPath = COLLECT_SURVIVORS;
			// regenerate the moveset to collect any detected survivors
			regenerate_moves(current_world, sub);
		}
		return -1;
	}

int detect_survivors(assignment_3::Sensor &survivor_srv, int (&curr_world)[BOARD_H][BOARD_W], Sub&sub)
{
	// survivor detection. sensor gives general direction indicator (objectEast)
	// and an array of positions which correlate to distances. e.g. eastRadar = [1]
	// inidicates a survivor is 1 positions away.
	// east is col + 1
	int newSurvivorsDetected = 0;
	// east is col + 1
	if (survivor_srv.response.objectEast)
		for (int i = 0; i < survivor_srv.request.sensorRange; i++)
			if (survivor_srv.response.eastRadar[i])
				if (curr_world[sub.sub_x][sub.sub_y + 1 + i] != SURVIVOR)
				{
					newSurvivorsDetected++;
					curr_world[sub.sub_x][sub.sub_y + 1 + i] = SURVIVOR;
					ROS_INFO("Robot has detected a survivor east!");
				}
	// west is col - 1
	if (survivor_srv.response.objectWest)
		for (int i = 0; i < survivor_srv.request.sensorRange; i++)
			if (survivor_srv.response.westRadar[i])
				if (curr_world[sub.sub_x][sub.sub_y - 1 - i] != SURVIVOR)
				{
					newSurvivorsDetected++;
					curr_world[sub.sub_x][sub.sub_y - 1 - i] = SURVIVOR;
					ROS_INFO("Robot has detected a survivor west!");
				}
	// north is row - 1
	if (survivor_srv.response.objectNorth)
		for (int i = 0; i < survivor_srv.request.sensorRange; i++)
			if (survivor_srv.response.northRadar[i])
				if (curr_world[sub.sub_x - 1 - i][sub.sub_y] != SURVIVOR)
				{
					newSurvivorsDetected++;
					curr_world[sub.sub_x - 1 - i][sub.sub_y] = SURVIVOR;
					ROS_INFO("Robot has detected a survivor north!");
				}
	// south is row + 1
	if (survivor_srv.response.objectSouth)
		for (int i = 0; i < survivor_srv.request.sensorRange; i++)
			if (survivor_srv.response.southRadar[i])
				if (curr_world[sub.sub_x + 1 + i][sub.sub_y] != SURVIVOR)
				{
					newSurvivorsDetected++;
					curr_world[sub.sub_x + 1 + i][sub.sub_y] = SURVIVOR;
					ROS_INFO("Robot has detected a survivor south!");
				}
	return newSurvivorsDetected;
}

std::pair<int, int> update_position(std::string &move, int &x, int &y)
{
	// moving right is col + 1
	if (move == "moveRight")
		return {x, y + 1};
	// moving left is col - 1
	else if (move == "moveLeft")
		return {x, y - 1};
	// moving up is row - 1
	else if (move == "moveUp")
		return {x - 1, y};
	// moving down is row + 1
	else if (move == "moveDown")
		return {x + 1, y};
	std::cerr << "update_position found invalid move: " << move << std::endl;
	return {x, y};
}

void update_directions(Sub&sub)
{
	// open the output file generated by PAT.
	std::ifstream pat_output(PAT_OUTPUT_DIR);
	if (!pat_output.is_open())
	{
		std::cerr << "Failed to open PAT output file!" << std::endl;
		exit(1);
	}
	// remove all current direcitons
	while (!sub.q.empty())
		sub.q.pop();
	// line used to read lines from output
	std::string line;
	// move used to read moves
	std::string move;
	while (getline(pat_output, line))
	{							  // continue reading lines from output file
		if (line[0] == '<') // line with moveset always starts with < (<init>)
		{
			// create a string stream from the line so that we may read into move
			std::istringstream ss(line);
			ss >> move; // skip <init
			// each move will be preceded by " -> "
			while (ss >> move) // while move preceded by " -> "
			{
				ss >> move;
				// now move var has current move
				sub.q.push(move); // push current move onto queue
			}
			// removing '>' from last move
			sub.q.back().pop_back();
			break; // no need to continue looping after moves have been read
		}
	}
	// close output file
	pat_output.close();
	return;
}

void generate_world(int (&world)[BOARD_H][BOARD_W])
{
	// init world with EMPTY
	for (int i = 0; i < BOARD_H; ++i)
		for (int j = 0; j < BOARD_W; ++j)
			world[i][j] = EMPTY;

	// place sub in home position denoted by SUB_START_X and SUB_START_Y (origin)
	world[SUB_START_X][SUB_START_Y] = SUB;
	world[SUB_START_X2][SUB_START_Y2] = SUB2;

	// random number generators for random row/column
	std::random_device rd;
	std::mt19937 gen(rd());
	std::uniform_int_distribution<int> rowDist(0, BOARD_H - 1);
	std::uniform_int_distribution<int> colDist(0, BOARD_W - 1);

	// place survivors randomly
	int placed = 0;
	while (placed < SURVIVOR_COUNT)
	{
		int rand_row = rowDist(gen);
		int rand_col = colDist(gen);
		if (world[rand_row][rand_col] == EMPTY)
		{
			world[rand_row][rand_col] = SURVIVOR;
			placed++;
		}
	}
}

void generate_known_world(int (&world)[BOARD_H][BOARD_W], Sub&sub)
{
	// open world.csp file to write to
	std::ofstream file(PAT_WORLD_DIR);
	if (!file.is_open())
	{
		std::cerr << "Failed to save the current world to world.csp" << std::endl;
		exit(1);
	}
	ROS_INFO("Writing robot's current interpretation to world file.");

	// write defines
	file << "#define Visited " << VISITED << ";\n";
	file << "#define Unvisited " << EMPTY << ";\n";
	file << "#define Sub " << sub.id << ";\n";			
	file << "#define Survivor " << SURVIVOR << ";\n\n";
	file << "#define SUB_HOME_X " << SUB_START_X << ";\n";
	file << "#define SUB_HOME_Y " << SUB_START_Y << ";\n";
	file << "#define Rows " << BOARD_H << ";\n";
	file << "#define Cols " << BOARD_W << ";\n";

	// write new array representation of world
	file << "\nvar world[Rows][Cols]:{Visited..Survivor} = [\n";
	for (int i = 0; i < BOARD_H; i++)
	{
		for (int j = 0; j < BOARD_W; j++)
		{
			if (i == BOARD_H - 1 && j == BOARD_W - 1)
				file << world[i][j];
			else
				file << world[i][j] << ", ";
		}
		file << "\n";
	}
	file << "];\n\n";

	file << "// Position of sub\n";
	file << "var xpos:{0..Rows-1} = " << sub.sub_x << ";\n";
	file << "var ypos:{0..Cols-1} = " << sub.sub_y << ";\n";
	file.close();
}

std::vector<int> translate_world(int (&world)[BOARD_H][BOARD_W])
{
	std::vector<int> vec(BOARD_W * BOARD_H, EMPTY);
	for (int i = 0; i < BOARD_H; i++)
		for (int j = 0; j < BOARD_W; j++)
			vec[i * BOARD_W + j] = world[i][j];
	return vec;
}

void regenerate_moves(int (&current_world)[BOARD_H][BOARD_W], Sub&sub)
{
	// generate world.csp so path.csp has access to current environment
	generate_known_world(current_world, sub);

	// get output from pat (generate pat_output.txt)
	if (sub.currentPath == SURVEY_AREA)
	{
		ROS_INFO("Calculating a path to survey remaining area");
		std::system(PAT_CMD_EXPLORE.c_str());
	}
	else if (sub.currentPath == COLLECT_SURVIVORS)
	{
		ROS_INFO("Calculating a path to collect remaining survivors");
		// collect status code returned from the system call
		int status = std::system(PAT_CMD_COLLECT_SURVIVORS_BFS.c_str());
		// fatal error if status call is not positive integer
		if (status < 0)
		{
			std::cout << "There has been a fatal error!: " << strerror(errno) << '\n';
			exit(1);
		}
		else
		{
			if (WIFEXITED(status))
			{
				if (WEXITSTATUS(status) == 124)
				{ // exit code is 124 if timeout kills process due to exceeded time limit
					// in this case, we want to run the DFS version of the same algorithm
					// as we expect it to run faster
					ROS_INFO("BFS Path calculation for survivor collection took too long, now calculating DFS path.");
					std::system(PAT_CMD_COLLECT_SURVIVORS_DFS.c_str());
				}
			}
			// system call must have been killed, or fatal error
			else
			{
				std::cout << "PAT call was killed :(\n";
				exit(1);
			}
		}
	}
	else if (sub.currentPath == GO_HOME)
	{
		ROS_INFO("Calculating a path to go home");
		// collect status code returned from the system call
		int status = std::system(PAT_CMD_GO_HOME_BFS.c_str());
		// fatal error if status call is not positive integer
		if (status < 0)
		{
			std::cout << "There has been a fatal error!: " << strerror(errno) << '\n';
			exit(1);
		}
		else
		{
			if (WIFEXITED(status))
			{
				if (WEXITSTATUS(status) == 124)
				{ // exit code is 124 if timeout kills process due to exceeded time limit
					// in this case, we want to run the DFS version of the same algorithm
					// as we expect it to run faster
					ROS_INFO("BFS Path calculation for going home took too long, now calculating DFS path.");
					std::system(PAT_CMD_GO_HOME_DFS.c_str());
				}
			}
			// system call must have been killed, or fatal error
			else
			{
				std::cout << "PAT call was killed :(\n";
				exit(1);
			}
		}
	}
	else
	{
		ROS_WARN("Received unknown path command! Aborting mission!");
		exit(1);
	}

	// extract directions given by PAT in output file
	update_directions(sub);
}

void execute_move(int (&current_world)[BOARD_H][BOARD_W], int (&true_world)[BOARD_H][BOARD_W], Sub&sub, std::pair<int, int> &new_coords)
{
	// change internal representation (new position now visited)
	int new_x = new_coords.first;
	int new_y = new_coords.second;
	current_world[new_x][new_y] = VISITED;

	// change true representation (old position now visited, new position now sub)
	true_world[sub.sub_x][sub.sub_y] = VISITED;
	true_world[new_x][new_y] = sub.id;
}

std_msgs::Int32MultiArray createGrid(int (&true_world)[BOARD_H][BOARD_W])
{
	// used to convert from 1D array back to 2D array
	std_msgs::Int32MultiArray true_grid;
	true_grid.layout.dim.push_back(std_msgs::MultiArrayDimension());
	true_grid.layout.dim.push_back(std_msgs::MultiArrayDimension());
	true_grid.layout.dim[0].label = "height";
	true_grid.layout.dim[1].label = "width";
	true_grid.layout.dim[0].size = BOARD_H;
	true_grid.layout.dim[1].size = BOARD_W;
	true_grid.layout.dim[0].stride = BOARD_H * BOARD_W;
	true_grid.layout.dim[1].stride = BOARD_W;
	true_grid.layout.data_offset = 0;
	true_grid.data = translate_world(true_world);
	return true_grid;
}