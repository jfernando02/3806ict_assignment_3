; Auto-generated. Do not edit!


(cl:in-package assignment_3-srv)


;//! \htmlinclude UpdateGrid-request.msg.html

(cl:defclass <UpdateGrid-request> (roslisp-msg-protocol:ros-message)
  ((grid
    :reader grid
    :initarg :grid
    :type std_msgs-msg:Int32MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Int32MultiArray)))
)

(cl:defclass UpdateGrid-request (<UpdateGrid-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdateGrid-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdateGrid-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment_3-srv:<UpdateGrid-request> is deprecated: use assignment_3-srv:UpdateGrid-request instead.")))

(cl:ensure-generic-function 'grid-val :lambda-list '(m))
(cl:defmethod grid-val ((m <UpdateGrid-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:grid-val is deprecated.  Use assignment_3-srv:grid instead.")
  (grid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdateGrid-request>) ostream)
  "Serializes a message object of type '<UpdateGrid-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grid) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdateGrid-request>) istream)
  "Deserializes a message object of type '<UpdateGrid-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grid) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdateGrid-request>)))
  "Returns string type for a service object of type '<UpdateGrid-request>"
  "assignment_3/UpdateGridRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateGrid-request)))
  "Returns string type for a service object of type 'UpdateGrid-request"
  "assignment_3/UpdateGridRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdateGrid-request>)))
  "Returns md5sum for a message object of type '<UpdateGrid-request>"
  "3dbc50c5d55e9f856ee8749f65c2321a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdateGrid-request)))
  "Returns md5sum for a message object of type 'UpdateGrid-request"
  "3dbc50c5d55e9f856ee8749f65c2321a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdateGrid-request>)))
  "Returns full string definition for message of type '<UpdateGrid-request>"
  (cl:format cl:nil "# models request/response for the update_grid service~%# this updates gazebo with the new locations of objects~%~%# expects 1D array of all locations, which are translated into~%# 2D coordinate system~%std_msgs/Int32MultiArray grid~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdateGrid-request)))
  "Returns full string definition for message of type 'UpdateGrid-request"
  (cl:format cl:nil "# models request/response for the update_grid service~%# this updates gazebo with the new locations of objects~%~%# expects 1D array of all locations, which are translated into~%# 2D coordinate system~%std_msgs/Int32MultiArray grid~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdateGrid-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grid))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdateGrid-request>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdateGrid-request
    (cl:cons ':grid (grid msg))
))
;//! \htmlinclude UpdateGrid-response.msg.html

(cl:defclass <UpdateGrid-response> (roslisp-msg-protocol:ros-message)
  ((altered_grid
    :reader altered_grid
    :initarg :altered_grid
    :type std_msgs-msg:Int32MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Int32MultiArray)))
)

(cl:defclass UpdateGrid-response (<UpdateGrid-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdateGrid-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdateGrid-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment_3-srv:<UpdateGrid-response> is deprecated: use assignment_3-srv:UpdateGrid-response instead.")))

(cl:ensure-generic-function 'altered_grid-val :lambda-list '(m))
(cl:defmethod altered_grid-val ((m <UpdateGrid-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_3-srv:altered_grid-val is deprecated.  Use assignment_3-srv:altered_grid instead.")
  (altered_grid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdateGrid-response>) ostream)
  "Serializes a message object of type '<UpdateGrid-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'altered_grid) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdateGrid-response>) istream)
  "Deserializes a message object of type '<UpdateGrid-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'altered_grid) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdateGrid-response>)))
  "Returns string type for a service object of type '<UpdateGrid-response>"
  "assignment_3/UpdateGridResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateGrid-response)))
  "Returns string type for a service object of type 'UpdateGrid-response"
  "assignment_3/UpdateGridResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdateGrid-response>)))
  "Returns md5sum for a message object of type '<UpdateGrid-response>"
  "3dbc50c5d55e9f856ee8749f65c2321a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdateGrid-response)))
  "Returns md5sum for a message object of type 'UpdateGrid-response"
  "3dbc50c5d55e9f856ee8749f65c2321a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdateGrid-response>)))
  "Returns full string definition for message of type '<UpdateGrid-response>"
  (cl:format cl:nil "std_msgs/Int32MultiArray altered_grid~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdateGrid-response)))
  "Returns full string definition for message of type 'UpdateGrid-response"
  (cl:format cl:nil "std_msgs/Int32MultiArray altered_grid~%~%================================================================================~%MSG: std_msgs/Int32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%int32[]           data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdateGrid-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'altered_grid))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdateGrid-response>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdateGrid-response
    (cl:cons ':altered_grid (altered_grid msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'UpdateGrid)))
  'UpdateGrid-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'UpdateGrid)))
  'UpdateGrid-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateGrid)))
  "Returns string type for a service object of type '<UpdateGrid>"
  "assignment_3/UpdateGrid")