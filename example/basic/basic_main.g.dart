// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.player;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializer
// **************************************************************************

abstract class _$PlayerJsonSerializer implements MapSerializer {
  Player get model;

  Map toMap() {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["email"] = model.email;
    ret["age"] = model.age;
    ret["score"] = model.score;
    ret["emailConfirmed"] = model.emailConfirmed;
    return ret;
  }

  Player fromMap(Map map) {
    if (map is! Map) {
      return null;
    }
    model.name = map["name"];
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
    model.emailConfirmed = map["emailConfirmed"];
    return model;
  }
}
