// Auto-generated. Do not edit!

// (in-package yolo_detect.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class target {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ClassName = null;
      this.conf = null;
      this.tl_x = null;
      this.tl_y = null;
      this.br_x = null;
      this.br_y = null;
    }
    else {
      if (initObj.hasOwnProperty('ClassName')) {
        this.ClassName = initObj.ClassName
      }
      else {
        this.ClassName = '';
      }
      if (initObj.hasOwnProperty('conf')) {
        this.conf = initObj.conf
      }
      else {
        this.conf = 0.0;
      }
      if (initObj.hasOwnProperty('tl_x')) {
        this.tl_x = initObj.tl_x
      }
      else {
        this.tl_x = 0;
      }
      if (initObj.hasOwnProperty('tl_y')) {
        this.tl_y = initObj.tl_y
      }
      else {
        this.tl_y = 0;
      }
      if (initObj.hasOwnProperty('br_x')) {
        this.br_x = initObj.br_x
      }
      else {
        this.br_x = 0;
      }
      if (initObj.hasOwnProperty('br_y')) {
        this.br_y = initObj.br_y
      }
      else {
        this.br_y = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type target
    // Serialize message field [ClassName]
    bufferOffset = _serializer.string(obj.ClassName, buffer, bufferOffset);
    // Serialize message field [conf]
    bufferOffset = _serializer.float32(obj.conf, buffer, bufferOffset);
    // Serialize message field [tl_x]
    bufferOffset = _serializer.int32(obj.tl_x, buffer, bufferOffset);
    // Serialize message field [tl_y]
    bufferOffset = _serializer.int32(obj.tl_y, buffer, bufferOffset);
    // Serialize message field [br_x]
    bufferOffset = _serializer.int32(obj.br_x, buffer, bufferOffset);
    // Serialize message field [br_y]
    bufferOffset = _serializer.int32(obj.br_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type target
    let len;
    let data = new target(null);
    // Deserialize message field [ClassName]
    data.ClassName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [conf]
    data.conf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [tl_x]
    data.tl_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [tl_y]
    data.tl_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [br_x]
    data.br_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [br_y]
    data.br_y = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.ClassName.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolo_detect/target';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '975a9db10eefa3284189115d7225099b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string ClassName
    float32 conf
    int32 tl_x
    int32 tl_y
    int32 br_x
    int32 br_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new target(null);
    if (msg.ClassName !== undefined) {
      resolved.ClassName = msg.ClassName;
    }
    else {
      resolved.ClassName = ''
    }

    if (msg.conf !== undefined) {
      resolved.conf = msg.conf;
    }
    else {
      resolved.conf = 0.0
    }

    if (msg.tl_x !== undefined) {
      resolved.tl_x = msg.tl_x;
    }
    else {
      resolved.tl_x = 0
    }

    if (msg.tl_y !== undefined) {
      resolved.tl_y = msg.tl_y;
    }
    else {
      resolved.tl_y = 0
    }

    if (msg.br_x !== undefined) {
      resolved.br_x = msg.br_x;
    }
    else {
      resolved.br_x = 0
    }

    if (msg.br_y !== undefined) {
      resolved.br_y = msg.br_y;
    }
    else {
      resolved.br_y = 0
    }

    return resolved;
    }
};

module.exports = target;
