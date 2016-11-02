part of serializer.map_serializer;

/// Annotation to ignore a field while encoding or decoding
class IgnoreField {
  /// Field in the model to ignore
  final String field;

  /// Should the field be ignored while encoding?
  final bool encode;

  /// Should the field be ignored while decoding?
  final bool decode;

  const IgnoreField(this.field): encode = false, decode = false;

  const IgnoreField.Encode(this.field): encode = false, decode = true;

  const IgnoreField.Decode(this.field): encode= true, decode = false;
}

/// Annotation used to request encoding of a field in model
class EncodeField {
  /// Field in the model to encode
  final String field;

  /// Optional. Key used to encode the model in the [Map]
  final String as;

  const EncodeField(this.field, {this.as});
}

/// Annotation used to request decoding of a field in model
class DecodeField {
  /// Field in the model to decode
  final String field;

  /// Optional. Key used to decode the model from the [Map]
  final String from;

  const DecodeField(this.field, {this.from});
}

/// Annotation used to request encoding and decoding of a field in model
class EnDecodeField {
  /// Field in the model that should be decoded and encoded
  final Symbol field;

  /// Optional. Key used to decode and encode the model from and to the [Map]
  final String fromAndAs;

  const EnDecodeField(this.field, {this.fromAndAs});
}