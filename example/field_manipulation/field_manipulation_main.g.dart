// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.field_manipulation;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializer
// **************************************************************************

abstract class _$PlayerJsonSerializer implements MapSerializer<Player> {
  Map toMap(Player model) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["N"] = model.name;
      }
      if (model.email != null) {
        ret["E"] = model.email;
      }
      if (model.age != null) {
        ret["A"] = model.age;
      }
      if (model.score != null) {
        ret["S"] = model.score;
      }
    }
    return ret;
  }

  Player fromMap(Map map, {Player model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Player) {
      model = createModel();
    }
    model.name = map["N"];
    model.email = map["E"];
    model.age = map["A"];
    model.score = map["S"];
    return model;
  }
}
