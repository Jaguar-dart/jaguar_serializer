// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.field_manipulation;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerMongoSerializer
// **************************************************************************

abstract class _$PlayerMongoSerializer implements MapSerializer {
  Player get model;

  Map toMap() {
    Map ret = new Map();
    ret["_id"] = new MongoId(#id).to(model.id);
    ret["name"] = model.name;
    ret["email"] = model.email;
    return ret;
  }

  Player fromMap(Map map) {
    if (map is! Map) {
      return null;
    }
    model.id = new MongoId(#id).from(map["_id"]);
    model.name = map["name"];
    model.email = map["email"];
    return model;
  }
}
