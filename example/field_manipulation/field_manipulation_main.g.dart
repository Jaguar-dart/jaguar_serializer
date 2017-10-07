// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.field_manipulation;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializer
// **************************************************************************

abstract class _$PlayerJsonSerializer implements Serializer<Player> {
  Map toMap(Player model, {bool withType: false, String typeKey}) {
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
      if (model.emailConfirmed != null) {
        ret["emailConfirmed"] = model.emailConfirmed;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Player fromMap(Map map, {Player model, String typeKey}) {
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
    model.emailConfirmed = map["emailConfirmed"];
    return model;
  }

  String modelString() => "Player";
}
