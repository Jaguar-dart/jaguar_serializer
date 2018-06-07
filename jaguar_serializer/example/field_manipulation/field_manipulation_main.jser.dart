// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_manipulation_main.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerJsonSerializer implements Serializer<Player> {
  @override
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'N', model.name);
      setNullableValue(ret, 'E', model.email);
      setNullableValue(ret, 'A', model.age);
      setNullableValue(ret, 'S', model.score);
    }
    return ret;
  }

  @override
  Player fromMap(Map map, {Player model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Player();
    obj.name = map['N'] as String;
    obj.email = map['E'] as String;
    obj.age = map['A'] as int;
    obj.score = map['S'] as int;
    return obj;
  }
}
