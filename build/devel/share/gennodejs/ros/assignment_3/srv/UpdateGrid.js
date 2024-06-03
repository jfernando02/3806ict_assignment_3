// Auto-generated. Do not edit!

// (in-package assignment_3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class UpdateGridRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.grid = null;
    }
    else {
      if (initObj.hasOwnProperty('grid')) {
        this.grid = initObj.grid
      }
      else {
        this.grid = new std_msgs.msg.Int32MultiArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UpdateGridRequest
    // Serialize message field [grid]
    bufferOffset = std_msgs.msg.Int32MultiArray.serialize(obj.grid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UpdateGridRequest
    let len;
    let data = new UpdateGridRequest(null);
    // Deserialize message field [grid]
    data.grid = std_msgs.msg.Int32MultiArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Int32MultiArray.getMessageSize(object.grid);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment_3/UpdateGridRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8edb9fee51c9cbb6f68136762f7ddaf2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # models request/response for the update_grid service
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
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UpdateGridRequest(null);
    if (msg.grid !== undefined) {
      resolved.grid = std_msgs.msg.Int32MultiArray.Resolve(msg.grid)
    }
    else {
      resolved.grid = new std_msgs.msg.Int32MultiArray()
    }

    return resolved;
    }
};

class UpdateGridResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.altered_grid = null;
    }
    else {
      if (initObj.hasOwnProperty('altered_grid')) {
        this.altered_grid = initObj.altered_grid
      }
      else {
        this.altered_grid = new std_msgs.msg.Int32MultiArray();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UpdateGridResponse
    // Serialize message field [altered_grid]
    bufferOffset = std_msgs.msg.Int32MultiArray.serialize(obj.altered_grid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UpdateGridResponse
    let len;
    let data = new UpdateGridResponse(null);
    // Deserialize message field [altered_grid]
    data.altered_grid = std_msgs.msg.Int32MultiArray.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Int32MultiArray.getMessageSize(object.altered_grid);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment_3/UpdateGridResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1972952a3ee019757d5667ef30196377';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    # dim[0].label  = "height"
    # dim[0].size   = 480
    # dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
    # dim[1].label  = "width"
    # dim[1].size   = 640
    # dim[1].stride = 3*640 = 1920
    # dim[2].label  = "channel"
    # dim[2].size   = 3
    # dim[2].stride = 3
    #
    # multiarray(i,j,k) refers to the ith row, jth column, and kth channel.
    
    ================================================================================
    MSG: std_msgs/MultiArrayDimension
    string label   # label of given dimension
    uint32 size    # size of given dimension (in type units)
    uint32 stride  # stride of given dimension
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UpdateGridResponse(null);
    if (msg.altered_grid !== undefined) {
      resolved.altered_grid = std_msgs.msg.Int32MultiArray.Resolve(msg.altered_grid)
    }
    else {
      resolved.altered_grid = new std_msgs.msg.Int32MultiArray()
    }

    return resolved;
    }
};

module.exports = {
  Request: UpdateGridRequest,
  Response: UpdateGridResponse,
  md5sum() { return '3dbc50c5d55e9f856ee8749f65c2321a'; },
  datatype() { return 'assignment_3/UpdateGrid'; }
};
