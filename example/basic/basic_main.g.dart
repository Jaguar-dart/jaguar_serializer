// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.player;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializer
// **************************************************************************

abstract class _$PlayerJsonSerializer implements MapSerializer<Player> {
  Map toMap(Player model) {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["email"] = model.email;
    ret["age"] = model.age;
    ret["score"] = model.score;
    ret["emailConfirmed"] = model.emailConfirmed;
    return ret;
  }

  Player fromMap(Map map, {Player model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Player) {
      model = createModel();
    }
    model.name = map["name"];
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
    model.emailConfirmed = map["emailConfirmed"];
    return model;
  }
}
