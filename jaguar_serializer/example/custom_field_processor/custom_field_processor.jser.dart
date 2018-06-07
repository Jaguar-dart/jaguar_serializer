// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field_processor.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerMongoSerializer implements Serializer<Player> {
  final _mongoId = const MongoId();

  @override
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, '_id', _mongoId.serialize(model.id));
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'email', model.email);
    }
    return ret;
  }

  @override
  Player fromMap(Map map, {Player model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Player();
    obj.id = _mongoId.deserialize(map['_id'] as ObjectId);
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    return obj;
  }
}
