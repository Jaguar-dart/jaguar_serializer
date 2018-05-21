// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  @override
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'email', model.email);
      setNullableValue(ret, 'age', model.age);
      setNullableValue(ret, 'score', model.score);
      setNonNullableValue(ret, 'emailConfirmed', model.emailConfirmed);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Player fromMap(Map<String, dynamic> map, {Player model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Player();
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.age = map['age'] as int;
    obj.score = map['score'] as int;
    obj.emailConfirmed = map['emailConfirmed'] as bool;
    return obj;
  }

  @override
  String modelString() => 'Player';
}

abstract class _$PlayerSerializerIgnore implements Serializer<Player> {
  @override
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'email', model.email);
      setNullableValue(ret, 'age', model.age);
      setNullableValue(ret, 'score', model.score);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Player fromMap(Map<String, dynamic> map, {Player model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Player();
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.age = map['age'] as int;
    obj.score = map['score'] as int;
    return obj;
  }

  @override
  String modelString() => 'Player';
}

abstract class _$PlayerSerializerIgnores implements Serializer<Player> {
  @override
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'score', model.score);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Player fromMap(Map<String, dynamic> map, {Player model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Player();
    obj.name = map['name'] as String;
    obj.score = map['score'] as int;
    return obj;
  }

  @override
  String modelString() => 'Player';
}

abstract class _$PlayerSerializerRename implements Serializer<Player> {
  @override
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'N', model.name);
      setNullableValue(ret, 'email', model.email);
      setNullableValue(ret, 'age', model.age);
      setNullableValue(ret, 'S', model.score);
      setNullableValue(ret, 'eC', model.emailConfirmed);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Player fromMap(Map<String, dynamic> map, {Player model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Player();
    obj.name = map['N'] as String;
    obj.email = map['email'] as String;
    obj.age = map['age'] as int;
    obj.score = map['score'] as int;
    obj.emailConfirmed = map['eC'] as bool;
    return obj;
  }

  @override
  String modelString() => 'Player';
}
