// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.field_manipulation;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerJsonSerializer implements Serializer<Player> {
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "N", model.name);
      setNullableValue(ret, "E", model.email);
      setNullableValue(ret, "A", model.age);
      setNullableValue(ret, "S", model.score);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Player fromMap(Map<String, dynamic> map, {Player model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Player) {
      model = new Player();
    }
    model.name = map["N"] as String;
    model.email = map["E"] as String;
    model.age = map["A"] as int;
    model.score = map["S"] as int;
    return model;
  }

  String modelString() => "Player";
}
