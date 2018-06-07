import '../serializer/serializer.dart';
import '../serializer/field_processor.dart';

/// Annotation used to request generation of serializer
class GenSerializer {
  /// Should all fields be included by default?
  ///
  /// Default to [true]
  final bool includeByDefault;

  /// Specify whether a property could be encoded, only, decoded only or both
  final Map<String, Field> fields;

  /// List of properties that shall be ignored
  final List<String> ignore;

  /// Supplies [Serializer]s to use when unknown PODO type is encountered
  final List<Type> serializers;

  /// Enable null check on fields if false
  ///
  /// Default to [true]
  final bool nullableFields;

  /// Determine the format for a field, [none] by default
  ///
  /// Example:
  ///
  /// ```dart
  /// class Model {
  ///   String myField;
  /// }
  ///
  /// @GenSerializer(fieldFormat: FieldFormat.snakeCase)
  /// class ModelSerializer extends Serializer ... {}
  ///
  /// final map = { 'my_field': 'foo' };
  /// final model = serializer.fromMap(map);
  /// print(model.myField); // print 'foo'
  /// ```
  final String fieldFormat;

  const GenSerializer(
      {this.fields: const <String, Field>{},
      this.ignore: const <String>[],
      this.serializers: const <Type>[],
      this.includeByDefault: true,
      this.nullableFields: true,
      this.fieldFormat});
}

class Field<T> {
  final String encodeTo;
  final String decodeFrom;
  final bool isNullable;
  final FieldProcessor<T, dynamic> processor;
  final T defaultsTo;
  final bool valueFromConstructor;
  final bool dontEncode;
  final bool dontDecode;

  const Field(
      {this.encodeTo,
      this.decodeFrom,
      this.isNullable,
      this.defaultsTo,
      this.processor,
      this.valueFromConstructor,
      this.dontDecode: false,
      this.dontEncode: false});

  const Field.onlyEncode(
      {this.encodeTo,
      this.isNullable,
      this.defaultsTo,
      this.processor,
      this.valueFromConstructor})
      : dontEncode = false,
        decodeFrom = null,
        dontDecode = true;

  const Field.onlyDecode(
      {this.decodeFrom,
      this.isNullable,
      this.defaultsTo,
      this.processor,
      this.valueFromConstructor})
      : dontEncode = true,
        encodeTo = null,
        dontDecode = false;

  const Field.ignore()
      : encodeTo = null,
        decodeFrom = null,
        isNullable = null,
        defaultsTo = null,
        processor = null,
        valueFromConstructor = false,
        dontEncode = true,
        dontDecode = true;
}

// can't use inheritance here, [DartObject.getField] does not support getter,
// only fields

/// Annotation used to request encoding and decoding of a field in model
class EnDecode<T> extends Field<T> {
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
class Ignore extends Field<dynamic> {
  const Ignore() : super(dontEncode: true, dontDecode: true);
}

/// Annotation used to request encoding and decoding of a field in model
/// shortcup for `const EnDecode(alias: "key")`
/// become `const Alias("key")`
class Alias<T> extends Field<T> {
  const Alias(
    String alias, {
    bool isNullable,
    FieldProcessor<T, dynamic> processor,
    T defaultsTo,
    bool valueFromConstructor,
  }) : super(
            encodeTo: alias,
            decodeFrom: alias,
            isNullable: isNullable,
            processor: processor,
            defaultsTo: defaultsTo);
}

const ignore = const Ignore();
const Field nullable = const Field<dynamic>(isNullable: true);
const Field nonNullable = const Field<dynamic>(isNullable: false);
const Field useConstructorForDefaultsValue =
    const Field<dynamic>(valueFromConstructor: true, isNullable: false);

/// Determine the output format for a field
/// Example:
///     class Foo {
///         String camelCase = "bar";
///     }
///
///     @GenSerializer(fieldFormat: FieldFormat.snakeCase)
///     class FooSerializer ...
///
/// will produce
///    {
///       "camel_case": "bar"
///    }
class FieldFormat {
  static const camelCase = 'camelCase';
  static const snakeCase = 'snakeCase';
  static const kebabCase = 'kebabCase';
}
