library serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/src/serializer/import.dart';

abstract class JsonSerializer<ModelType> {
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
    implements MapSerializer<ModelType>, JsonSerializer<ModelType> {
  String toJson(ModelType model) => JSON.encode(toMap(model));

  ModelType fromJson(String json, {ModelType model}) =>
      fromMap(JSON.decode(json), model: model);
}

abstract class JsonSerializable<ModelType> {
  JsonSerializer<ModelType> get jsonSerializer;

  String toJson() => jsonSerializer.toJson(this as ModelType);

  void fromJson(String json) {
    jsonSerializer.fromJson(json, model: (this as ModelType));
  }
}
