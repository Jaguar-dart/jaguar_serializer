import 'package:meta/meta.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:jaguar_serializer_cli/src/utils/type_checkers.dart';

class CtorArgument {
  final ParameterElement param;

  final bool canSerialize;

  CtorArgument(this.param, this.canSerialize);

  String get name => param.displayName;
}

class SerializerInfo {
  /// Name of the serializer
  final String name;
  final String modelName;
  final Map<String, Field> fields;
  final List<CtorArgument> ctorArguments;
  final List<ParameterElement> ctorNamedArguments;
  String nameFormatter;

  SerializerInfo(this.name, this.modelName, this.fields,
      {this.ctorArguments, this.ctorNamedArguments, this.nameFormatter});
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
  final DartType type;

  final bool dontEncode;

  final bool dontDecode;

  final bool isFinal;

  String encodeTo;

  String decodeFrom;

  final FieldProcessorInfo processor;

  final bool isNullable;

  TypeInfo typeInfo;

  Field(
      {@required this.name,
      @required this.dontEncode,
      @required this.dontDecode,
      @required this.type,
      this.isFinal: false,
      @required this.encodeTo,
      @required this.decodeFrom,
      @required this.processor,
      @required this.isNullable});
}

abstract class TypeInfo {}

class MapTypeInfo implements TypeInfo {
  final TypeInfo keyInfo;

  final String keyTypeString;

  final TypeInfo valueInfo;

  final String valueTypeStr;
  MapTypeInfo(
      this.keyInfo, this.keyTypeString, this.valueInfo, this.valueTypeStr);
}

class ListTypeInfo implements TypeInfo {
  final TypeInfo itemInfo;
  final String itemTypeStr;
  ListTypeInfo(this.itemInfo, this.itemTypeStr);
}

class SetTypeInfo implements TypeInfo {
  final TypeInfo itemInfo;
  final String itemTypeStr;
  SetTypeInfo(this.itemInfo, this.itemTypeStr);
}

abstract class LeafTypeInfo implements TypeInfo {}

class BuiltinTypeInfo implements LeafTypeInfo {
  final String typeStr;
  BuiltinTypeInfo(this.typeStr);
}

class EnumTypeInfo implements LeafTypeInfo {
  final String typeStr;
  EnumTypeInfo(this.typeStr);
}

class ProcessedTypeInfo implements LeafTypeInfo {
  final String instantiationString;
  final String serializedType;
  final String deserializedType;
  final String respType;
  ProcessedTypeInfo(this.instantiationString, this.serializedType,
      this.deserializedType, this.respType);
}

class SerializedTypeInfo implements LeafTypeInfo {
  final String instantiationString;
  final String type;
  SerializedTypeInfo(this.instantiationString, this.type);
}
