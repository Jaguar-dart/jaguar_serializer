library jaguar_serializer.annotations;

import 'package:jaguar_serializer/src/serializer/serializer.dart';

/// Annotation used to request generation of serializer
class GenSerializer {
  /// Supply optional modelName
  final String modelName;

  /// Should fields be included by default?
  ///
  /// Defaults to [true]
  final bool includeByDefault;

  /// Specify whether a property could be encoded, only, decoded only or both
  final Map<String, Property> fields;

  /// List of properties that shall be ignored
  final List<String> ignore;

  /// [FieldProcessor] that shall be used to encode and decode specified property
  final Map<String, FieldProcessor> processors;

  /// Supplies [Serializer]s to use when unknown PODO type is encountered
  final List<Type> serializers;

  const GenSerializer(
      {this.fields: const {},
      this.ignore: const [],
      this.processors: const {},
      this.serializers: const [],
      this.modelName,
      this.includeByDefault: true});
}

abstract class Property {}

/// Annotation used to request encoding of a field in model
class EncodeOnly implements Property {
  /// Optional. Key used to encode the model in the [Map]
  final String alias;

  const EncodeOnly([this.alias]);
}

/// Annotation used to request decoding of a field in model
class DecodeOnly implements Property {
  /// Optional. Key used to decode the model from the [Map]
  final String alias;

  const DecodeOnly([this.alias]);
}

/// Annotation used to request encoding and decoding of a field in model
class EnDecode implements Property {
  /// Optional. Key used to decode and encode the model from and to the [Map]
  final String alias;

  const EnDecode([this.alias]);
}

/// Annotation to ignore a field while encoding or decoding
class Ignore implements Property {
  const Ignore();
}
