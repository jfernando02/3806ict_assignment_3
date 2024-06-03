// Auto-generated. Do not edit!

// (in-package assignment_3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SensorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sensorRange = null;
      this.subID = null;
    }
    else {
      if (initObj.hasOwnProperty('sensorRange')) {
        this.sensorRange = initObj.sensorRange
      }
      else {
        this.sensorRange = 0;
      }
      if (initObj.hasOwnProperty('subID')) {
        this.subID = initObj.subID
      }
      else {
        this.subID = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorRequest
    // Serialize message field [sensorRange]
    bufferOffset = _serializer.int32(obj.sensorRange, buffer, bufferOffset);
    // Serialize message field [subID]
    bufferOffset = _serializer.int32(obj.subID, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorRequest
    let len;
    let data = new SensorRequest(null);
    // Deserialize message field [sensorRange]
    data.sensorRange = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [subID]
    data.subID = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment_3/SensorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '989288cfff8e9e902b72e5737ffeb13a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Sensor srv models request/response for sensors
    # expects a given range to look for objects
    int32 sensorRange
    int32 subID
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorRequest(null);
    if (msg.sensorRange !== undefined) {
      resolved.sensorRange = msg.sensorRange;
    }
    else {
      resolved.sensorRange = 0
    }

    if (msg.subID !== undefined) {
      resolved.subID = msg.subID;
    }
    else {
      resolved.subID = 0
    }

    return resolved;
    }
};

class SensorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.objectNorth = null;
      this.objectSouth = null;
      this.objectEast = null;
      this.objectWest = null;
      this.objectDetected = null;
      this.northRadar = null;
      this.southRadar = null;
      this.eastRadar = null;
      this.westRadar = null;
    }
    else {
      if (initObj.hasOwnProperty('objectNorth')) {
        this.objectNorth = initObj.objectNorth
      }
      else {
        this.objectNorth = false;
      }
      if (initObj.hasOwnProperty('objectSouth')) {
        this.objectSouth = initObj.objectSouth
      }
      else {
        this.objectSouth = false;
      }
      if (initObj.hasOwnProperty('objectEast')) {
        this.objectEast = initObj.objectEast
      }
      else {
        this.objectEast = false;
      }
      if (initObj.hasOwnProperty('objectWest')) {
        this.objectWest = initObj.objectWest
      }
      else {
        this.objectWest = false;
      }
      if (initObj.hasOwnProperty('objectDetected')) {
        this.objectDetected = initObj.objectDetected
      }
      else {
        this.objectDetected = false;
      }
      if (initObj.hasOwnProperty('northRadar')) {
        this.northRadar = initObj.northRadar
      }
      else {
        this.northRadar = [];
      }
      if (initObj.hasOwnProperty('southRadar')) {
        this.southRadar = initObj.southRadar
      }
      else {
        this.southRadar = [];
      }
      if (initObj.hasOwnProperty('eastRadar')) {
        this.eastRadar = initObj.eastRadar
      }
      else {
        this.eastRadar = [];
      }
      if (initObj.hasOwnProperty('westRadar')) {
        this.westRadar = initObj.westRadar
      }
      else {
        this.westRadar = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SensorResponse
    // Serialize message field [objectNorth]
    bufferOffset = _serializer.bool(obj.objectNorth, buffer, bufferOffset);
    // Serialize message field [objectSouth]
    bufferOffset = _serializer.bool(obj.objectSouth, buffer, bufferOffset);
    // Serialize message field [objectEast]
    bufferOffset = _serializer.bool(obj.objectEast, buffer, bufferOffset);
    // Serialize message field [objectWest]
    bufferOffset = _serializer.bool(obj.objectWest, buffer, bufferOffset);
    // Serialize message field [objectDetected]
    bufferOffset = _serializer.bool(obj.objectDetected, buffer, bufferOffset);
    // Serialize message field [northRadar]
    bufferOffset = _arraySerializer.int32(obj.northRadar, buffer, bufferOffset, null);
    // Serialize message field [southRadar]
    bufferOffset = _arraySerializer.int32(obj.southRadar, buffer, bufferOffset, null);
    // Serialize message field [eastRadar]
    bufferOffset = _arraySerializer.int32(obj.eastRadar, buffer, bufferOffset, null);
    // Serialize message field [westRadar]
    bufferOffset = _arraySerializer.int32(obj.westRadar, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SensorResponse
    let len;
    let data = new SensorResponse(null);
    // Deserialize message field [objectNorth]
    data.objectNorth = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [objectSouth]
    data.objectSouth = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [objectEast]
    data.objectEast = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [objectWest]
    data.objectWest = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [objectDetected]
    data.objectDetected = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [northRadar]
    data.northRadar = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [southRadar]
    data.southRadar = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [eastRadar]
    data.eastRadar = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [westRadar]
    data.westRadar = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.northRadar.length;
    length += 4 * object.southRadar.length;
    length += 4 * object.eastRadar.length;
    length += 4 * object.westRadar.length;
    return length + 21;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment_3/SensorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '014542b4fc21a2f4be0ac376e228b21c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # boolean responses allow for easy access to whether objects were detected
    # and in which direction
    bool objectNorth
    bool objectSouth
    bool objectEast
    bool objectWest
    bool objectDetected
    
    int32[] northRadar
    int32[] southRadar
    int32[] eastRadar
    int32[] westRadar
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SensorResponse(null);
    if (msg.objectNorth !== undefined) {
      resolved.objectNorth = msg.objectNorth;
    }
    else {
      resolved.objectNorth = false
    }

    if (msg.objectSouth !== undefined) {
      resolved.objectSouth = msg.objectSouth;
    }
    else {
      resolved.objectSouth = false
    }

    if (msg.objectEast !== undefined) {
      resolved.objectEast = msg.objectEast;
    }
    else {
      resolved.objectEast = false
    }

    if (msg.objectWest !== undefined) {
      resolved.objectWest = msg.objectWest;
    }
    else {
      resolved.objectWest = false
    }

    if (msg.objectDetected !== undefined) {
      resolved.objectDetected = msg.objectDetected;
    }
    else {
      resolved.objectDetected = false
    }

    if (msg.northRadar !== undefined) {
      resolved.northRadar = msg.northRadar;
    }
    else {
      resolved.northRadar = []
    }

    if (msg.southRadar !== undefined) {
      resolved.southRadar = msg.southRadar;
    }
    else {
      resolved.southRadar = []
    }

    if (msg.eastRadar !== undefined) {
      resolved.eastRadar = msg.eastRadar;
    }
    else {
      resolved.eastRadar = []
    }

    if (msg.westRadar !== undefined) {
      resolved.westRadar = msg.westRadar;
    }
    else {
      resolved.westRadar = []
    }

    return resolved;
    }
};

module.exports = {
  Request: SensorRequest,
  Response: SensorResponse,
  md5sum() { return '546dae9226dd84d9996bfa16115be7c7'; },
  datatype() { return 'assignment_3/Sensor'; }
};
