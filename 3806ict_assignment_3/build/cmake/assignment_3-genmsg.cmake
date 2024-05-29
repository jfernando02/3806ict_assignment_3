# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "assignment_3: 0 messages, 2 services")

set(MSG_I_FLAGS "-Igazebo_msgs:/opt/ros/noetic/share/gazebo_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(assignment_3_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv" NAME_WE)
add_custom_target(_assignment_3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment_3" "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv" "std_msgs/MultiArrayLayout:std_msgs/Int32MultiArray:std_msgs/MultiArrayDimension"
)

get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv" NAME_WE)
add_custom_target(_assignment_3_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "assignment_3" "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_3
)
_generate_srv_cpp(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_3
)

### Generating Module File
_generate_module_cpp(assignment_3
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_3
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(assignment_3_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(assignment_3_generate_messages assignment_3_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_cpp _assignment_3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_cpp _assignment_3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_3_gencpp)
add_dependencies(assignment_3_gencpp assignment_3_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_3_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_3
)
_generate_srv_eus(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_3
)

### Generating Module File
_generate_module_eus(assignment_3
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_3
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(assignment_3_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(assignment_3_generate_messages assignment_3_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_eus _assignment_3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_eus _assignment_3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_3_geneus)
add_dependencies(assignment_3_geneus assignment_3_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_3_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_3
)
_generate_srv_lisp(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_3
)

### Generating Module File
_generate_module_lisp(assignment_3
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_3
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(assignment_3_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(assignment_3_generate_messages assignment_3_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_lisp _assignment_3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_lisp _assignment_3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_3_genlisp)
add_dependencies(assignment_3_genlisp assignment_3_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_3_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_3
)
_generate_srv_nodejs(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_3
)

### Generating Module File
_generate_module_nodejs(assignment_3
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_3
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(assignment_3_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(assignment_3_generate_messages assignment_3_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_nodejs _assignment_3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_nodejs _assignment_3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_3_gennodejs)
add_dependencies(assignment_3_gennodejs assignment_3_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_3_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Int32MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_3
)
_generate_srv_py(assignment_3
  "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_3
)

### Generating Module File
_generate_module_py(assignment_3
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_3
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(assignment_3_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(assignment_3_generate_messages assignment_3_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/UpdateGrid.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_py _assignment_3_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/student/catkin_ws/src/3806ict_assignment_3/srv/Sensor.srv" NAME_WE)
add_dependencies(assignment_3_generate_messages_py _assignment_3_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(assignment_3_genpy)
add_dependencies(assignment_3_genpy assignment_3_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS assignment_3_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/assignment_3
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_cpp)
  add_dependencies(assignment_3_generate_messages_cpp gazebo_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(assignment_3_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(assignment_3_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/assignment_3
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_eus)
  add_dependencies(assignment_3_generate_messages_eus gazebo_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(assignment_3_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(assignment_3_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/assignment_3
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_lisp)
  add_dependencies(assignment_3_generate_messages_lisp gazebo_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(assignment_3_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(assignment_3_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_3)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/assignment_3
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_nodejs)
  add_dependencies(assignment_3_generate_messages_nodejs gazebo_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(assignment_3_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(assignment_3_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_3)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_3\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/assignment_3
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET gazebo_msgs_generate_messages_py)
  add_dependencies(assignment_3_generate_messages_py gazebo_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(assignment_3_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(assignment_3_generate_messages_py std_msgs_generate_messages_py)
endif()
