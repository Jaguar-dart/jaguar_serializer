import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:jaguar_serializer_cli/src/utils/string.dart';

class SerializerInfo {
  /// Name of the serializer
  final String name;
  final String modelName;
  final Map<String, Field> fields;
  final ctorArguments = <ParameterElement>[];
  final ctorNamedArguments = <ParameterElement>[];

  SerializerInfo(this.name, this.modelName, this.fields);
}

class FieldProcessorInfo {
  final String instantiationString;
  final String serializedType;
  final String deserializedType;

  FieldProcessorInfo(
      this.instantiationString, this.serializedType, this.deserializedType);
}

class Field {
  /// Name of the field
  final String name;

  /// Type of the field
  final InterfaceType type;

  final bool dontEncode;

  final bool dontDecode;

  final bool isFinal;

  final String encodeTo;

  final String decodeFrom;

  final FieldProcessorInfo processor;

  final ClassElement provider;

  final bool isNullable;

  final String defaultValue;

  final bool fromConstructor;

  TypeInfo typeInfo;

  // TODO field formatter

  Field(
      {@required this.name,
      @required this.dontEncode,
      @required this.dontDecode,
      @required this.type,
      this.isFinal: false,
      @required this.encodeTo,
      @required this.decodeFrom,
      @required this.processor,
      @required this.provider,
      @required this.isNullable,
      @required this.defaultValue,
      @required this.fromConstructor});
}

abstract class TypeInfo {}

class MapTypeInfo {
  final TypeInfo key;

  final String keyTypeString;

  final TypeInfo value;

  final String valueTypeStr;
}

class ListTypeInfo {
  final TypeInfo value;

  final String itemTypeStr;
}

abstract class LeafTypeInfo implements TypeInfo {}

class ProcessedTypeInfo implements LeafTypeInfo {
  final String instantiationString;
  final String serializedType;
  final String deserializedType;
}

class SerializedTypeInfo implements LeafTypeInfo {
  final String instantiationString;
  final String type;
}