library jaguar_serializer.annotations;

import '../serializer/serializer.dart';
import '../serializer/custom_codec.dart';

/// Annotation used to request generation of serializer
class GenSerializer {
  /// Supply optional modelName
  final String modelName;

  /// Should fields be included by default?
  ///
  /// Defaults to [true]
  final bool includeByDefault;

  /// Specify whether a property could be encoded, only, decoded only or both
  final Map<String, /* Property | List<Property> */ dynamic> fields;

  /// List of properties that shall be ignored
  final List<String> ignore;

  /// [FieldProcessor] that shall be used to encode and decode specified property
  @Deprecated("use fields property")
  final Map<String, FieldProcessor> processors;

  /// Supplies [Serializer]s to use when unknown PODO type is encountered
  final List<Type> serializers;

  /// Enable null check on fields
  final bool nullableFields;

  const GenSerializer(
      {this.fields: const <String, List<Property>>{},
      this.ignore: const <String>[],
      this.processors: const <String, FieldProcessor>{},
      this.serializers: const <Type>[],
      this.modelName,
      this.includeByDefault: true,
      this.nullableFields: false});
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

const ignore = const Ignore();

/// Annotation used to disable null check on field
class Nullable implements Property {
  const Nullable();
}

const nullable = const Nullable();

/// Annotation used to enable null check on field
class NonNullable implements Property {
  const NonNullable();
}

const nonNullable = const NonNullable();

class DefaultStringValue implements Property {
  final String value;
  const DefaultStringValue(this.value);
}

class DefaultDoubleValue implements Property {
  final double value;
  const DefaultDoubleValue(this.value);
}

class DefaultIntValue implements Property {
  final int value;
  const DefaultIntValue(this.value);
}

class DefaultBoolValue implements Property {
  final bool value;
  const DefaultBoolValue(this.value);
}