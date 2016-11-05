library jaguar_serializer.generator.parser.model;

import 'package:analyzer/dart/element/element.dart';

import 'package:jaguar_serializer/generator/internal/element/element.dart';

class ModelField {
  /// Name of the field
  String name;

  /// Type of the field
  DartTypeWrap type;

  ModelField(this.name, this.type);
}

class Model {
  ClassElementWrap model;

  List<ModelField> to = [];

  List<ModelField> from = [];
}

Model parseModel(ClassElementWrap modelClazz) {
  Model mod = new Model();

  mod.model = modelClazz;

  modelClazz.fields
      .where((FieldElement field) => !field.isStatic)
      .forEach((FieldElement field) {
    if (field.getter is PropertyAccessorElement) {
      mod.to.add(new ModelField(field.name, new DartTypeWrap(field.type)));
    }

    if (field.setter is PropertyAccessorElement) {
      mod.from.add(new ModelField(field.name, new DartTypeWrap(field.type)));
    }
  });

  return mod;
}
