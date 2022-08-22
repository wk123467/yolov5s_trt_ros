# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from yolo_detect/target.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class target(genpy.Message):
  _md5sum = "975a9db10eefa3284189115d7225099b"
  _type = "yolo_detect/target"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """string ClassName
float32 conf
int32 tl_x
int32 tl_y
int32 br_x
int32 br_y
"""
  __slots__ = ['ClassName','conf','tl_x','tl_y','br_x','br_y']
  _slot_types = ['string','float32','int32','int32','int32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       ClassName,conf,tl_x,tl_y,br_x,br_y

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(target, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.ClassName is None:
        self.ClassName = ''
      if self.conf is None:
        self.conf = 0.
      if self.tl_x is None:
        self.tl_x = 0
      if self.tl_y is None:
        self.tl_y = 0
      if self.br_x is None:
        self.br_x = 0
      if self.br_y is None:
        self.br_y = 0
    else:
      self.ClassName = ''
      self.conf = 0.
      self.tl_x = 0
      self.tl_y = 0
      self.br_x = 0
      self.br_y = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.ClassName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_f4i().pack(_x.conf, _x.tl_x, _x.tl_y, _x.br_x, _x.br_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.ClassName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.ClassName = str[start:end]
      _x = self
      start = end
      end += 20
      (_x.conf, _x.tl_x, _x.tl_y, _x.br_x, _x.br_y,) = _get_struct_f4i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.ClassName
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_f4i().pack(_x.conf, _x.tl_x, _x.tl_y, _x.br_x, _x.br_y))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.ClassName = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.ClassName = str[start:end]
      _x = self
      start = end
      end += 20
      (_x.conf, _x.tl_x, _x.tl_y, _x.br_x, _x.br_y,) = _get_struct_f4i().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_f4i = None
def _get_struct_f4i():
    global _struct_f4i
    if _struct_f4i is None:
        _struct_f4i = struct.Struct("<f4i")
    return _struct_f4i
