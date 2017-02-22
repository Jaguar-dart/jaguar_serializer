library jaguar_serializer.generator.parser.model;

import 'package:analyzer/dart/element/element.dart';

import 'package:source_gen_help/source_gen_help.dart';

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

  modelClazz
      .getAccessors(withSupertype: true)
      .where((PropertyAccessorElement field) =>
          !field.isStatic && !field.isPrivate)
      .forEach((PropertyAccessorElement field) {
    if (field.isGetter) {
      mod.to.add(new ModelField(
          field.displayName, new DartTypeWrap(field.returnType)));
    }

    if (field.isSetter) {
      mod.from.add(new ModelField(field.displayName,
          new DartTypeWrap(field.type.parameters.first.type)));
    }
  });

  return mod;
}
