library serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/src/serializer/import.dart';

@Deprecated("Use SerializerJson")
abstract class JsonSerializer<ModelType> {
  String toJson(dynamic model);

  dynamic fromJson(String json);

  String toJsonObject(ModelType model);

  ModelType fromJsonObject(String json, {ModelType model});

  String toJsonList(List<ModelType> models);

  List<ModelType> fromJsonList(String json);

  ModelType createModel();
}

/// Mixin that provides encoding and decoding JSON on top of [MapSerializer]
@Deprecated("Use SerializerJson")
abstract class JsonMixin<ModelType> implements MapSerializer<ModelType>, JsonSerializer<ModelType> {
  String toJson(dynamic model) {
    if (model is ModelType) {
      return toJsonObject(model);
    } else if (model is List<ModelType>) {
      return toJsonList(model);
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  dynamic fromJson(String json) {
    dynamic decoded = JSON.decode(json);
    if (decoded is Map) {
      return fromMap(decoded);
    } else if (decoded is List<Map>) {
      return decoded.map((Map map) => fromMap(map)).toList();
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  String toJsonObject(ModelType model) => JSON.encode(toMap(model));

  ModelType fromJsonObject(String json, {ModelType model}) => fromMap(JSON.decode(json), model: model);

  String toJsonList(List<ModelType> models) => JSON.encode(models.map((ModelType model) => toMap(model)).toList());

  List<ModelType> fromJsonList(String json) {
    dynamic decoded = JSON.decode(json);
    if (decoded is! List) return null;

    return (decoded as List).map((Map map) => fromMap(map)).toList();
  }
}

@Deprecated("Use SerializerJson")
abstract class JsonSerializable<ModelType> {
  MapSerializer<ModelType> get jsonSerializer;

  Map toJson() => jsonSerializer.toMap(this as ModelType);

  void fromJson(Map json) {
    jsonSerializer.fromMap(json, model: (this as ModelType));
  }
}

class SerializerJson extends Serializer {
  SerializerJson() : super((Object object) => JSON.encode(object), (String data) => JSON.decode(data));
}
