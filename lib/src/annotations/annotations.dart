library jaguar_serializer.annotations;

import 'package:jaguar_serializer/src/serializer/serializer.dart';

const String kLibAnnotations = 'jaguar_serializer.annotations';

/// Annotation used to request generation of serializer
class GenSerializer {
  final String modelName;

  final bool includeByDefault;

  final Map<String, Property> fields;

  final List<String> ignore;

  final Map<String, FieldProcessor> processors;

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
