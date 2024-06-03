;; Auto-generated. Do not edit!


(when (boundp 'assignment_3::UpdateGrid)
  (if (not (find-package "ASSIGNMENT_3"))
    (make-package "ASSIGNMENT_3"))
  (shadow 'UpdateGrid (find-package "ASSIGNMENT_3")))
(unless (find-package "ASSIGNMENT_3::UPDATEGRID")
  (make-package "ASSIGNMENT_3::UPDATEGRID"))
(unless (find-package "ASSIGNMENT_3::UPDATEGRIDREQUEST")
  (make-package "ASSIGNMENT_3::UPDATEGRIDREQUEST"))
(unless (find-package "ASSIGNMENT_3::UPDATEGRIDRESPONSE")
  (make-package "ASSIGNMENT_3::UPDATEGRIDRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass assignment_3::UpdateGridRequest
  :super ros::object
  :slots (_grid ))

(defmethod assignment_3::UpdateGridRequest
  (:init
   (&key
    ((:grid __grid) (instance std_msgs::Int32MultiArray :init))
    )
   (send-super :init)
   (setq _grid __grid)
   self)
  (:grid
   (&rest __grid)
   (if (keywordp (car __grid))
       (send* _grid __grid)
     (progn
       (if __grid (setq _grid (car __grid)))
       _grid)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int32MultiArray _grid
    (send _grid :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int32MultiArray _grid
       (send _grid :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int32MultiArray _grid
     (send _grid :deserialize buf ptr-) (incf ptr- (send _grid :serialization-length))
   ;;
   self)
  )

(defclass assignment_3::UpdateGridResponse
  :super ros::object
  :slots (_altered_grid ))

(defmethod assignment_3::UpdateGridResponse
  (:init
   (&key
    ((:altered_grid __altered_grid) (instance std_msgs::Int32MultiArray :init))
    )
   (send-super :init)
   (setq _altered_grid __altered_grid)
   self)
  (:altered_grid
   (&rest __altered_grid)
   (if (keywordp (car __altered_grid))
       (send* _altered_grid __altered_grid)
     (progn
       (if __altered_grid (setq _altered_grid (car __altered_grid)))
       _altered_grid)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int32MultiArray _altered_grid
    (send _altered_grid :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int32MultiArray _altered_grid
       (send _altered_grid :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int32MultiArray _altered_grid
     (send _altered_grid :deserialize buf ptr-) (incf ptr- (send _altered_grid :serialization-length))
   ;;
   self)
  )

(defclass assignment_3::UpdateGrid
  :super ros::object
  :slots ())

(setf (get assignment_3::UpdateGrid :md5sum-) "3dbc50c5d55e9f856ee8749f65c2321a")
(setf (get assignment_3::UpdateGrid :datatype-) "assignment_3/UpdateGrid")
(setf (get assignment_3::UpdateGrid :request) assignment_3::UpdateGridRequest)
(setf (get assignment_3::UpdateGrid :response) assignment_3::UpdateGridResponse)

(defmethod assignment_3::UpdateGridRequest
  (:response () (instance assignment_3::UpdateGridResponse :init)))

(setf (get assignment_3::UpdateGridRequest :md5sum-) "3dbc50c5d55e9f856ee8749f65c2321a")
(setf (get assignment_3::UpdateGridRequest :datatype-) "assignment_3/UpdateGridRequest")
(setf (get assignment_3::UpdateGridRequest :definition-)
      "# models request/response for the update_grid service
# this updates gazebo with the new locations of objects

# expects 1D array of all locations, which are translated into
# 2D coordinate system
std_msgs/Int32MultiArray grid

================================================================================
MSG: std_msgs/Int32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int32[]           data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
std_msgs/Int32MultiArray altered_grid

================================================================================
MSG: std_msgs/Int32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int32[]           data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")

(setf (get assignment_3::UpdateGridResponse :md5sum-) "3dbc50c5d55e9f856ee8749f65c2321a")
(setf (get assignment_3::UpdateGridResponse :datatype-) "assignment_3/UpdateGridResponse")
(setf (get assignment_3::UpdateGridResponse :definition-)
      "# models request/response for the update_grid service
# this updates gazebo with the new locations of objects

# expects 1D array of all locations, which are translated into
# 2D coordinate system
std_msgs/Int32MultiArray grid

================================================================================
MSG: std_msgs/Int32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int32[]           data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
std_msgs/Int32MultiArray altered_grid

================================================================================
MSG: std_msgs/Int32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
int32[]           data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")



(provide :assignment_3/UpdateGrid "3dbc50c5d55e9f856ee8749f65c2321a")


