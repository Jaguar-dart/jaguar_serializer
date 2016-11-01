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

class MakeSerializer {
  const MakeSerializer();
}

class EncodeField {
  final String field;

  final String as;

  const EncodeField(this.field, {this.as});
}

class DecodeField {
  final String field;

  final String from;

  const DecodeField(this.field, {this.from});
}

class EnDecodeField {
  final Symbol field;

  final String fromAndAs;

  const EnDecodeField(this.field, {this.fromAndAs});
}

class DefineFieldProcessor {
  const DefineFieldProcessor();
}

abstract class FieldProcessor {
  Symbol get field;

  dynamic from(dynamic value);

  dynamic to(dynamic value);
}