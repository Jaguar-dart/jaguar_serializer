///@nodoc
library jaguar_serializer.generator.parser.model;

import 'package:analyzer/dart/element/element.dart';

import 'package:source_gen_help/source_gen_help.dart';

import 'package:jaguar_serializer/src/generator/parser/serializer_parser/serializer_parser.dart';

class ModelField {
  /// Name of the field
  String name;

  /// Type of the field
  DartTypeWrap type;

  ModelField(this.name, this.type);
}

class Model {
  ClassElementWrap model;

  Map<String, ModelField> _fieldsTo = {};
  Map<String, ModelField> _fieldsFrom = {};

  void addTo(ModelField field) {
    _fieldsTo[field.name] = field;
  }

  void addFrom(ModelField field) {
    _fieldsFrom[field.name] = field;
  }

  List<ModelField> get to => _fieldsTo.values.toList();

  List<ModelField> get from => _fieldsFrom.values.toList();
}

Model parseModel(
    ClassElementWrap modelClazz, SerializerInfo info, bool includeByDefault) {
  Model mod = new Model();

  mod.model = modelClazz;

  modelClazz
      .getAccessors(withSupertype: true)
      .where((PropertyAccessorElement field) =>
          !field.isStatic && !field.isPrivate)
      .forEach((PropertyAccessorElement field) {
    if (field.isGetter) {
      if (includeByDefault || info.toRename.containsKey(field.displayName)) {
        mod.addTo(new ModelField(
            field.displayName, new DartTypeWrap(field.returnType)));
      }
    }

    if (field.isSetter) {
      if (includeByDefault || info.fromRename.containsKey(field.displayName)) {
        mod.addFrom(new ModelField(field.displayName,
            new DartTypeWrap(field.type.parameters.first.type)));
      }
    }
  });

  return mod;
}
