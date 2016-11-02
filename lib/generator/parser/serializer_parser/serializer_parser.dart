library jaguar_serializer.generator.parser.serializer;

import 'dart:mirrors';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

import 'package:jaguar_serializer/generator/internal/element/element.dart';

import 'package:jaguar_serializer/generator/parser/model_parser/model_parser.dart';

import 'package:jaguar_serializer/src/map_serializer/import.dart';

part 'ignore_field.dart';

const NamedElementImpl kMapSerializer =
    const NamedElementImpl.Make('MapSerializer', 'serializer.map_serializer');

void collectFieldsMetadata(ClassElementWrap clazz) {
  //TODO
}

void collectProviders(ClassElementWrap clazz) {
  //TODO
}

SerializerInfo parseSerializer(ClassElementWrap clazz) {
  final InterfaceTypeWrap interface = clazz.allSupertypes
      .map((InterfaceType type) => new InterfaceTypeWrap(type))
      .firstWhere(
          (InterfaceTypeWrap interface) => interface.isSame(kMapSerializer));

  if(interface.typeArguments.length != 1) {
    throw new Exception("Should have only one type argument!");
  }

  DartTypeWrap typeArg = interface.typeArguments.first;

  if(typeArg.isDynamic) {
    throw new Exception("Model cannot be dynamic!");
  }

  SerializerInfo ret = new SerializerInfo(clazz.name);

  _collectIgnoreField(ret, clazz);
  _collectIgnoreFields(ret, clazz);

  ret.model = parseModel(typeArg.clazz);

  return ret;
}

class SerializerInfo {
  String name;

  Set<String> ignoreFieldsTo = new Set<String>();

  Set<String> ignoreFieldsFrom = new Set<String>();

  Map<String, CustomFieldCodecInfo> customFieldCodecs = {};

  Map<DartTypeWrap, DartTypeWrap> serializationProviders = {};

  Model model = new Model();

  SerializerInfo(this.name);
}

class CustomFieldCodecInfo {

}

class SerializerWriteInfo {
  final String name;

  final List<ToField> to;

  final List<FromField> from;

  SerializerWriteInfo(this.name, [this.to = const [], this.from = const []]);

  factory SerializerWriteInfo.FromInfo(SerializerInfo info) {
    //TODO use ignore fields
    //TODO use custom codecs
    //TODO use serialization providers
    //TODO use field renaming

    List<ToField> tos = <ToField>[];

    for(ModelField field in info.model.to) {
      if(!info.ignoreFieldsTo.contains(field.name)) {
        tos.add(new ToFieldNormal(field.name, field.name, field.type));
      }
    }

    List<FromField> froms = <FromField>[];

    for(ModelField field in info.model.from) {
      if(!info.ignoreFieldsFrom.contains(field.name)) {
        froms.add(new FromFieldNormal(field.name, field.name, field.type));
      }
    }

    return new SerializerWriteInfo(info.name, tos, froms);
  }
}

abstract class ToField {
  String get key;

  String get name;

  /// Type of the field
  DartTypeWrap get type;
}

class ToFieldNormal implements ToField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  ToFieldNormal(this.key, this.name, this.type);
}

abstract class FromField {
  String get key;

  String get name;

  /// Type of the field
  DartTypeWrap get type;
}

class FromFieldNormal implements FromField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  FromFieldNormal(this.key, this.name, this.type);
}