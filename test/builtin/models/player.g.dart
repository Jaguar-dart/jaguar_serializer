// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.player;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializer
// **************************************************************************

abstract class _$PlayerJsonSerializer implements MapSerializer {
  Player get model;

  Map toMap() {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["email"] = model.email;
    ret["age"] = model.age;
    ret["score"] = model.score;
    ret["emailConfirmed"] = model.emailConfirmed;
    return ret;
  }

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }
    model.name = map["name"];
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
    model.emailConfirmed = map["emailConfirmed"];
  }
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializerIgnore
// **************************************************************************

abstract class _$PlayerJsonSerializerIgnore implements MapSerializer {
  Player get model;

  Map toMap() {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["email"] = model.email;
    ret["age"] = model.age;
    ret["score"] = model.score;
    return ret;
  }

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }
    model.name = map["name"];
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
  }
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializerIgnores
// **************************************************************************

abstract class _$PlayerJsonSerializerIgnores implements MapSerializer {
  Player get model;

  Map toMap() {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["score"] = model.score;
    return ret;
  }

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }
    model.name = map["name"];
    model.score = map["score"];
  }
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerJsonSerializerRename
// **************************************************************************

abstract class _$PlayerJsonSerializerRename implements MapSerializer {
  Player get model;

  Map toMap() {
    Map ret = new Map();
    ret["N"] = model.name;
    ret["E"] = model.email;
    ret["A"] = model.age;
    ret["S"] = model.score;
    ret["emailConfirmed"] = model.emailConfirmed;
    return ret;
  }

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }
    model.name = map["N"];
    model.email = map["E"];
    model.age = map["A"];
    model.score = map["S"];
    model.emailConfirmed = map["emailConfirmed"];
  }
}
