import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:jaguar_serializer_cli/src/utils/string.dart';
import 'package:jaguar_serializer_cli/src/utils/type_checkers.dart';

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
  String get instantiationString => self.element.displayName;
  String get serializedStr => serialized.displayName;
  String get deserializedStr => deserialized.displayName;

  DartType get serialized => fp.typeArguments[1];
  DartType get deserialized => fp.typeArguments[0];

  final ParameterizedType self;
  final InterfaceType fp;

  FieldProcessorInfo(this.self)
      : fp = (self.element as ClassElement)
            .allSupertypes
            .firstWhere((s) => isFieldProcessor.isExactlyType(s));
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

class MapTypeInfo implements TypeInfo {
  final TypeInfo key;

  final String keyTypeString;

  final TypeInfo value;

  final String valueTypeStr;
  MapTypeInfo(this.key, this.keyTypeString, this.value, this.valueTypeStr);
}

class ListTypeInfo implements TypeInfo {
  final TypeInfo value;
  final String itemTypeStr;
  ListTypeInfo(this.value, this.itemTypeStr);
}

abstract class LeafTypeInfo implements TypeInfo {}

class BuiltinTypeInfo implements LeafTypeInfo {
  final String typeStr;
  BuiltinTypeInfo(this.typeStr);
}

class ProcessedTypeInfo implements LeafTypeInfo {
  final String instantiationString;
  final String serializedType;
  final String deserializedType;
  ProcessedTypeInfo(
      this.instantiationString, this.serializedType, this.deserializedType);
}

class SerializedTypeInfo implements LeafTypeInfo {
  final String instantiationString;
  final String type;
  SerializedTypeInfo(this.instantiationString, this.type);
}
