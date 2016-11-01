library serializer.map_serializer;

import 'dart:convert';

abstract class MapSerializer<ModelType> {
  MapSerializer(ModelType model);

  MapSerializer.FromMap(Map map);

  Map toMap();

  void fromMap(Map map);

  ModelType get model;
}

abstract class JsonMixin implements MapSerializer {
  String toJson() => JSON.encode(toMap());

  void fromJson(String json) {
    Map map = JSON.decode(json);
    fromMap(map);
  }
}