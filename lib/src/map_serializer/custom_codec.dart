part of serializer.map_serializer;

/// Interface specification to add custom field decoders
abstract class FieldProcessor {
  /// Field in the model to be processed
  Symbol get field;

  /// Called to process field before decoding
  dynamic from(dynamic value);

  /// Called to process field before encoding
  dynamic to(dynamic value);
}

/// Annotation to define a field processor
class DefineFieldProcessor {
  const DefineFieldProcessor();
}