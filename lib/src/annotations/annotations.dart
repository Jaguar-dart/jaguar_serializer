library jaguar_serializer.annotations;

const String kLibAnnotations = 'jaguar_serializer.annotations';

/// Annotation used to request generation of serializer
class GenSerializer {
  const GenSerializer();
}

/// Annotation used to provide serializers for specific types
class ProvideSerializer {
  /// A mapping from Type to the serializer used for that Type
  final Type field;

  final Type serializer;

  const ProvideSerializer(this.field, this.serializer);
}

/// Annotation to ignore a field while encoding or decoding
class IgnoreField {
  /// Field in the model to ignore
  final Symbol field;

  /// Should the field be ignored while encoding?
  final bool encode;

  /// Should the field be ignored while decoding?
  final bool decode;

  const IgnoreField(this.field)
      : encode = true,
        decode = true;

  const IgnoreField.Encode(this.field)
      : encode = true,
        decode = false;

  const IgnoreField.Decode(this.field)
      : encode = false,
        decode = true;
}

/// Annotation to ignore a field while encoding or decoding
class IgnoreFields {
  /// Field in the model to ignore
  final List<Symbol> fields;

  /// Should the field be ignored while encoding?
  final bool encode;

  /// Should the field be ignored while decoding?
  final bool decode;

  const IgnoreFields(this.fields)
      : encode = true,
        decode = true;

  const IgnoreFields.Encode(this.fields)
      : encode = true,
        decode = false;

  const IgnoreFields.Decode(this.fields)
      : encode = false,
        decode = true;
}

/// Annotation used to request encoding of a field in model
class EncodeField {
  /// Field in the model to encode
  final Symbol field;

  /// Optional. Key used to encode the model in the [Map]
  final String as;

  const EncodeField(this.field, {this.as});
}

/// Annotation used to request decoding of a field in model
class DecodeField {
  /// Field in the model to decode
  final Symbol field;

  /// Optional. Key used to decode the model from the [Map]
  final String from;

  const DecodeField(this.field, {this.from});
}

/// Annotation used to request encoding and decoding of a field in model
class EnDecodeField {
  /// Field in the model that should be decoded and encoded
  final Symbol field;

  /// Optional. Key used to decode and encode the model from and to the [Map]
  final String asAndFrom;

  const EnDecodeField(this.field, {this.asAndFrom});
}

/// Annotation used to request encoding of a field in model
class EncodeFields {
  /// Field in the model to encode
  final Map<Symbol, String> fields;

  const EncodeFields(this.fields);
}

/// Annotation used to request decoding of a field in model
class DecodeFields {
  /// Field in the model to decode
  final Map<Symbol, String> fields;

  const DecodeFields(this.fields);
}

/// Annotation used to request encoding and decoding of a field in model
class EnDecodeFields {
  /// Field in the model that should be decoded and encoded
  final Map<Symbol, String> fields;

  const EnDecodeFields(this.fields);
}

/// Annotation to define a field processor
class DefineFieldProcessor {
  const DefineFieldProcessor();
}
