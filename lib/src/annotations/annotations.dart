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
  final Map<String, Property> fields;

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
      {this.fields: const <String, Property>{},
      this.ignore: const <String>[],
      this.processors: const <String, FieldProcessor>{},
      this.serializers: const <Type>[],
      this.modelName,
      this.includeByDefault: true,
      this.nullableFields: false});
}

class Property<T> {
  final String encodeTo;
  final String decodeFrom;
  final bool isNullable;
  final FieldProcessor<T, dynamic> processor;
  final T defaultsTo;
  final bool valueFromConstructor;

  const Property(
      {this.encodeTo,
      this.decodeFrom,
      this.isNullable,
      this.defaultsTo,
      this.processor,
      this.valueFromConstructor});
}

// can't use inheritance here, [DartObject.getField] does not support getter, only fields
/// Annotation used to request encoding of a field in model
class EncodeOnly<T> extends Property<T> {
  /// Optional. Key used to encode the model in the [Map]
  final String alias;
  final FieldProcessor<T, dynamic> processor;
  final bool isNullable;
  final T defaultsTo;
  final String encodeTo;
  final bool valueFromConstructor;

  const EncodeOnly(
      {this.alias,
      this.isNullable,
      this.defaultsTo,
      this.processor,
      this.valueFromConstructor})
      : encodeTo = alias;
}

/// Annotation used to request decoding of a field in model
class DecodeOnly<T> extends Property<T> {
  /// Optional. Key used to decode the model from the [Map]
  final String alias;
  final FieldProcessor<T, dynamic> processor;
  final bool isNullable;
  final T defaultsTo;
  final String decodeFrom;
  final bool valueFromConstructor;

  const DecodeOnly(
      {this.alias,
      this.isNullable,
      this.defaultsTo,
      this.processor,
      this.valueFromConstructor})
      : decodeFrom = alias;
}

/// Annotation used to request encoding and decoding of a field in model
class EnDecode<T> extends Property<T> {
  /// Optional. Key used to decode and encode the model from and to the [Map]
  final String alias;
  final FieldProcessor<T, dynamic> processor;
  final bool isNullable;
  final T defaultsTo;
  final String encodeTo;
  final String decodeFrom;
  final bool valueFromConstructor;

  const EnDecode(
      {this.alias,
      this.isNullable,
      this.defaultsTo,
      this.processor,
      this.valueFromConstructor})
      : encodeTo = alias,
        decodeFrom = alias;
}

/// Annotation to ignore a field while encoding or decoding
class Ignore extends EnDecode {
  const Ignore();
}

const ignore = const Ignore();
const Property nullable = const Property(isNullable: true);
const Property nonNullable = const Property(isNullable: false);
const Property useConstructorForDefaultsValue =
    const Property(valueFromConstructor: true, isNullable: false);
