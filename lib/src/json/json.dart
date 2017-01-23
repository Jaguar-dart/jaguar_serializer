library serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/src/serializer/import.dart';

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

abstract class JsonSerializable<ModelType> {
  MapSerializer<ModelType> get jsonSerializer;

  Map toJson() => jsonSerializer.toMap(this as ModelType);

  void fromJson(Map json) {
    jsonSerializer.fromMap(json, model: (this as ModelType));
  }
}

class SerializerJson {
  Map<Type, MapSerializer> _mapperType = {};
  Map<String, MapSerializer> _mapperString = {};

  String encode(Object object) => JSON.encode(toDart(object));

  Object decode(String json, {Type type}) => fromMap(JSON.decode(json), type: type);

  Map toMap(Object object) {
    MapSerializer serializer = getMapSerializerForType(object.runtimeType);
    return serializer.toMap(object);
  }

  List toList(List objects) => objects.map((object) => toDart(object)).toList();

  Object toDart(Object object) {
    if (object is Iterable) {
      return toDart(object.toList());
    }
    if (object is List) {
      return toList(object);
    } else if (object is Map) {
      object.forEach((key, value) {
        object[key] = toDart(object[key]);
      });
      return object;
    }
    return toMap(object);
  }

  Object fromMap(Map map, {Type type}) {
    MapSerializer serializer;
    try {
      serializer = getMapSerializerForType(type);
    } catch (e) {
      serializer = getMapSerializerFromMap(map);
    }
    return serializer.fromMap(map);
  }

  MapSerializer getMapSerializerForType(Type type) {
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    throw new Exception("No MapSerializer found for $type");
  }

  MapSerializer getMapSerializerFromMap(Map map) {
    if (map.containsKey(MapSerializer.type_info_key) && _mapperString.containsKey(map[MapSerializer.type_info_key])) {
      return _mapperString[map[MapSerializer.type_info_key]];
    }
    throw new Exception("No MapSerializer found for ${map[MapSerializer.type_info_key]}");
  }

  void addSerializer(MapSerializer serializer) {
    _mapperType[serializer.modelType] = serializer;
    _mapperString[serializer.modelString] = serializer;
  }
}
