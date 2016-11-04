library jaguar_serializer.generator.parser.serializer;

import 'dart:mirrors' show MirrorSystem;
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/constant/value.dart';

import 'package:jaguar_serializer/generator/internal/element/element.dart';

import 'package:jaguar_serializer/generator/parser/model_parser/model_parser.dart';

import 'package:jaguar_serializer/src/map_serializer/import.dart';

part 'field.dart';
part 'ignore_field.dart';
part 'field_metadata.dart';
part 'info.dart';
part 'providers.dart';
part 'custom_field.dart';

const String kLibMapSer = 'serializer.map_serializer';

const NamedElementImpl kMapSerializer =
    const NamedElementImpl.Make('MapSerializer', kLibMapSer);

const NamedElementImpl kFieldProcessor =
const NamedElementImpl.Make('FieldProcessor', kLibMapSer);

const NamedElementImpl kDefineFieldProcessor =
const NamedElementImpl.Make('DefineFieldProcessor', kLibMapSer);


SerializerInfo parseSerializer(ClassElementWrap clazz) {
  final InterfaceTypeWrap interface = clazz.allSupertypes
      .map((InterfaceType type) => new InterfaceTypeWrap(type))
      .firstWhere(
          (InterfaceTypeWrap interface) => interface.isSame(kMapSerializer));

  if (interface.typeArguments.length != 1) {
    throw new Exception("Should have only one type argument!");
  }

  DartTypeWrap typeArg = interface.typeArguments.first;

  if (typeArg.isDynamic) {
    throw new Exception("Model cannot be dynamic!");
  }

  SerializerInfo ret = new SerializerInfo(clazz.name);

  _collectProviders(ret, clazz);
  _collectCustomFields(ret, clazz);

  _collectIgnoreField(ret, clazz);
  _collectIgnoreFields(ret, clazz);

  _collectFieldsMetadata(ret, clazz);

  ret.model = parseModel(typeArg.clazz);

  return ret;
}
