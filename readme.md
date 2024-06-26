# 3806ICT Assignment 3 by:

-  Joseph Fernando
-  Zakaria Wardere
-  Thi Minh Oanh

This project requires an Ubuntu environment with ROS, Gazebo, and PAT installed. It models 3 UAVs as they explore their environment in a linear 2D fashion. The environment is resolved into a grid, where each position can contain a point of interest, a UAV or a marker to indicate whether it has been visited.

Gazebo simulates the environment and provides a 3D representation in real-time. ROS drives the submarine's main control loop, which extracts a list of moves to achieve pre-defined goals from PAT. For example, PAT is called via the command line to achieve a goal, such as "explore", and returns a list of moves to a text file. ROS reads this text file and iteratively translates this moveset into a positioning system, using emulated sensors to react to its immediate surroundings.

To successfully run this project on your own machine:

1. Clone this repository into the catkin workspace folder (under catkin_ws/src).
2. Compile the binaries in catkin_ws/src using catkin_make.
3. Launch the pre-set world which includes a birds-eye camera angle:
   `roslaunch assignment_3 launch_world.launch`
4. Run the update_grid node: `rosrun assignment_3 update_grid` in a new terminal window. This hosts three services used by the main submarine controller:

   -  survivor_sensor: Emulates a sensor (such as a camera) to identify points of interest within a given grid-range
   -  update_grid: This facilitates the communication between the main UAV controller and update_grid. It allows for gazebo to continue simulating the UAV as it moves throughout the environment and locates points of interest.

5. Run the search_rescue node: `rosrun assignment_3 search_rescue` in a new terminal window. This is the main driver of the UAV which communicates with PAT and translates the provided moveset into actions. It maintains an internal representation of where the UAV has visited which is updated each time it detects a point of interest (as informed by the survivor_sensor services).

**Please note that the project depends on the direct path to the PAT installation. Currently, it is set to `/Desktop/MONO-PAT-v3.6.0/PAT3.Console.exe`. If this path is incorrect, either relocate PAT to the expected path, or change `PAT_EXE_DIR` in the program to the correct path.**
