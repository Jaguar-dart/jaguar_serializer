// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.field_manipulation;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerMongoSerializer implements Serializer<Player> {
  final _mongoId = const MongoId();

  Map toMap(Player model, {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNonNullableValue(ret, "_id", _mongoId.serialize(model.id));
      setNonNullableValue(ret, "name", model.name);
      setNonNullableValue(ret, "email", model.email);
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
    model.id = _mongoId.deserialize(map["_id"]);
    model.name = map["name"];
    model.email = map["email"];
    return model;
  }

  String modelString() => "Player";
}
