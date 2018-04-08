// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field_processor.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerMongoSerializer implements Serializer<Player> {
  final _mongoId = const MongoId();

  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "_id", _mongoId.serialize(model.id));
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "email", model.email);
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
    model.id = _mongoId.deserialize(map["_id"] as ObjectId);
    model.name = map["name"] as String;
    model.email = map["email"] as String;
    return model;
  }

  String modelString() => "Player";
}
