// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.field_manipulation;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializer
// **************************************************************************

abstract class _$PlayerJsonSerializer implements MapSerializer {
  Player get model;

  Map toMap() {
    Map ret = new Map();
    ret["N"] = model.name;
    ret["E"] = model.email;
    ret["A"] = model.age;
    ret["S"] = model.score;
    return ret;
  }

  Player fromMap(Map map) {
    if (map is! Map) {
      return null;
    }
    model.name = map["N"];
    model.email = map["E"];
    model.age = map["A"];
    model.score = map["S"];
    return model;
  }
}
