// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.player;

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  final _mongoId = const MongoId();
  @override
  Map<String, dynamic> toMap(Player model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, '_id', _mongoId.serialize(model.id));
    setMapValue(ret, 'allianceId', _mongoId.serialize(model.allianceId));
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'age', model.age);
    setMapValue(ret, 'score', model.score);
    setMapValue(ret, 'emailConfirmed', model.emailConfirmed);
    return ret;
  }

  @override
  Player fromMap(Map map) {
    if (map == null) return null;
    final obj = new Player();
    obj.id = _mongoId.deserialize(map['_id'] as ObjectId) as String;
    obj.allianceId =
        _mongoId.deserialize(map['allianceId'] as ObjectId) as String;
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.age = map['age'] as int;
    obj.score = map['score'] as int;
    obj.emailConfirmed = map['emailConfirmed'] as bool;
    return obj;
  }
}
