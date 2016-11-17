part of serializer.serializer;

/// Interface specification to add custom field decoders
abstract class FieldProcessor<FromType, ToType> {
  /// Field in the model to be processed
  Symbol get field;

  /// Called to process field before decoding
  FromType from(ToType value);

  /// Called to process field before encoding
  ToType to(FromType value);
}

/// Annotation to define a field processor
class DefineFieldProcessor {
  const DefineFieldProcessor();
}
