library serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/src/serializer/import.dart';

abstract class Jsonable<ModelType> {
  String toJson(ModelType model);

  ModelType fromJson(String json, {ModelType model}) {
    if (model is! ModelType) {
      model = createModel();
    }

    return model;
  }

  ModelType createModel();
}

/// Mixin that provides encoding and decoding JSON on top of [MapSerializer]
abstract class JsonMixin<ModelType>
    implements MapSerializer<ModelType>, Jsonable<ModelType> {
  String toJson(ModelType model) => JSON.encode(toMap(model));

  ModelType fromJson(String json, {ModelType model}) =>
      fromMap(JSON.decode(json), model: model);
}
