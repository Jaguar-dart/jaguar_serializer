// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.player;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializer
// **************************************************************************

abstract class _$PlayerJsonSerializer implements MapSerializer<Player> {
  Map toMap(Player model) {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["email"] = model.email;
    ret["age"] = model.age;
    ret["score"] = model.score;
    ret["emailConfirmed"] = model.emailConfirmed;
    return ret;
  }

  Player fromMap(Map map, {Player model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Player) {
      model = createModel();
    }
    model.name = map["name"];
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
    model.emailConfirmed = map["emailConfirmed"];
    return model;
  }
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializerIgnore
// **************************************************************************

abstract class _$PlayerJsonSerializerIgnore implements MapSerializer<Player> {
  Map toMap(Player model) {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["email"] = model.email;
    ret["age"] = model.age;
    ret["score"] = model.score;
    return ret;
  }

  Player fromMap(Map map, {Player model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Player) {
      model = createModel();
    }
    model.name = map["name"];
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
    return model;
  }
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializerIgnores
// **************************************************************************

abstract class _$PlayerJsonSerializerIgnores implements MapSerializer<Player> {
  Map toMap(Player model) {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["score"] = model.score;
    return ret;
  }

  Player fromMap(Map map, {Player model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Player) {
      model = createModel();
    }
    model.name = map["name"];
    model.score = map["score"];
    return model;
  }
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializerRename
// **************************************************************************

abstract class _$PlayerJsonSerializerRename implements MapSerializer<Player> {
  Map toMap(Player model) {
    Map ret = new Map();
    ret["N"] = model.name;
    ret["E"] = model.email;
    ret["A"] = model.age;
    ret["S"] = model.score;
    ret["emailConfirmed"] = model.emailConfirmed;
    return ret;
  }

  Player fromMap(Map map, {Player model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Player) {
      model = createModel();
    }
    model.name = map["N"];
    model.email = map["E"];
    model.age = map["A"];
    model.score = map["score"];
    model.emailConfirmed = map["eC"];
    return model;
  }
}
