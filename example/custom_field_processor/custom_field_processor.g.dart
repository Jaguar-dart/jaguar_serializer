// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.field_manipulation;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerMongoSerializer
// **************************************************************************

abstract class _$PlayerMongoSerializer implements Serializer<Player> {
  Map toMap(Player model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["_id"] = new MongoId(#id).serialize(model.id);
      }
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.email != null) {
        ret["email"] = model.email;
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
    model.id = new MongoId(#id).deserialize(map["_id"]);
    model.name = map["name"];
    model.email = map["email"];
    return model;
  }

  String modelString() => "Player";
}
