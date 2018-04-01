// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.player;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "email", model.email);
      setNullableValue(ret, "age", model.age);
      setNullableValue(ret, "score", model.score);
      setNonNullableValue(ret, "emailConfirmed", model.emailConfirmed);
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
    model.name = map["name"] as String;
    model.email = map["email"] as String;
    model.age = map["age"] as int;
    model.score = map["score"] as int;
    model.emailConfirmed = map["emailConfirmed"] as bool;
    return model;
  }

  String modelString() => "Player";
}

abstract class _$PlayerSerializerIgnore implements Serializer<Player> {
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "email", model.email);
      setNullableValue(ret, "age", model.age);
      setNullableValue(ret, "score", model.score);
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
    model.name = map["name"] as String;
    model.email = map["email"] as String;
    model.age = map["age"] as int;
    model.score = map["score"] as int;
    return model;
  }

  String modelString() => "Player";
}

abstract class _$PlayerSerializerIgnores implements Serializer<Player> {
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "score", model.score);
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
    model.name = map["name"] as String;
    model.score = map["score"] as int;
    return model;
  }

  String modelString() => "Player";
}

abstract class _$PlayerSerializerRename implements Serializer<Player> {
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "N", model.name);
      setNullableValue(ret, "email", model.email);
      setNullableValue(ret, "age", model.age);
      setNullableValue(ret, "S", model.score);
      setNullableValue(ret, "eC", model.emailConfirmed);
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
    model.email = map["email"] as String;
    model.age = map["age"] as int;
    model.score = map["score"] as int;
    model.emailConfirmed = map["eC"] as bool;
    return model;
  }

  String modelString() => "Player";
}
