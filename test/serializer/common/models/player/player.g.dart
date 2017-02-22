// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.player;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerSerializer
// **************************************************************************

abstract class _$PlayerSerializer implements MapSerializer<Player> {
  Map toMap(Player model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.email != null) {
        ret["email"] = model.email;
      }
      if (model.age != null) {
        ret["age"] = model.age;
      }
      if (model.score != null) {
        ret["score"] = model.score;
      }
      if (model.emailConfirmed != null) {
        ret["emailConfirmed"] = model.emailConfirmed;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
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

  String get modelString => "Player";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerSerializerIgnore
// **************************************************************************

abstract class _$PlayerSerializerIgnore implements MapSerializer<Player> {
  Map toMap(Player model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.email != null) {
        ret["email"] = model.email;
      }
      if (model.age != null) {
        ret["age"] = model.age;
      }
      if (model.score != null) {
        ret["score"] = model.score;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
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

  String get modelString => "Player";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerSerializerIgnores
// **************************************************************************

abstract class _$PlayerSerializerIgnores implements MapSerializer<Player> {
  Map toMap(Player model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.score != null) {
        ret["score"] = model.score;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
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

  String get modelString => "Player";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerSerializerRename
// **************************************************************************

abstract class _$PlayerSerializerRename implements MapSerializer<Player> {
  Map toMap(Player model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["N"] = model.name;
      }
      if (model.email != null) {
        ret["email"] = model.email;
      }
      if (model.age != null) {
        ret["age"] = model.age;
      }
      if (model.score != null) {
        ret["S"] = model.score;
      }
      if (model.emailConfirmed != null) {
        ret["emailConfirmed"] = model.emailConfirmed;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
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
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
    model.emailConfirmed = map["eC"];
    return model;
  }

  String get modelString => "Player";
}
