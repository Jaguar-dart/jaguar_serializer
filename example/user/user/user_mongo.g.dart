// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.user.mongo;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserMongoSerializer
// **************************************************************************

abstract class _$UserMongoSerializer implements MapSerializer<User> {
  Map toMap(User model) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = new MongoId(#id).to(model.id);
      }
      if (model.email != null) {
        ret["email"] = model.email;
      }
      if (model.name != null) {
        ret["N"] = model.name;
      }
      if (model.dob != null) {
        ret["dob"] = new DateTimeSerializer(#dob).to(model.dob);
      }
      if (model.book != null) {
        ret["book"] = providers[Book]?.toMap(model.book);
      }
      if (model.listStr != null) {
        ret["listStr"] = model.listStr
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (model.listBook != null) {
        ret["listBook"] = model.listBook
            ?.map(
                (Book val) => val != null ? providers[Book]?.toMap(val) : null)
            ?.toList();
      }
      if (model.map != null) {
        ret["map"] =
            new MapMaker(model.map, (String key) => key, (String value) {
          return value;
        }).model;
      }
      if (model.mapMap != null) {
        ret["mapMap"] = new MapMaker(model.mapMap, (String key) => key,
            (Map<String, String> value) {
          return new MapMaker(value, (String key) => key, (String value) {
            return value;
          }).model;
        }).model;
      }
      if (model.mapBook != null) {
        ret["mapBook"] =
            new MapMaker(model.mapBook, (String key) => key, (Book value) {
          return providers[Book]?.toMap(value);
        }).model;
      }
      if (model.passwordHash != null) {
        ret["passwordHash"] = model.passwordHash;
      }
      if (modelString != null) {
        ret["@t"] = modelString;
      }
    }
    return ret;
  }

  User fromMap(Map map, {User model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! User) {
      model = createModel();
    }
    model.id = new MongoId(#id).from(map["id"]);
    model.email = map["email"];
    model.name = map["N"];
    model.dob = new DateTimeSerializer(#dob).from(map["dob"]);
    model.book = providers[Book]?.fromMap(map["book"]);
    model.listStr = map["listStr"]?.map((String val) => val)?.toList();
    model.listBook = map["listBook"]
        ?.map((dynamic val) => providers[Book]?.fromMap(val))
        ?.toList();
    model.map = new MapMaker(map["map"], (String key) => key, (String value) {
      return value;
    }).model as dynamic;
    model.mapMap = new MapMaker(map["mapMap"], (String key) => key,
        (Map<String, String> value) {
      return new MapMaker(value, (String key) => key, (String value) {
        return value;
      }).model as dynamic;
    }).model as dynamic;
    model.mapBook =
        new MapMaker(map["mapBook"], (String key) => key, (dynamic value) {
      return providers[Book]?.fromMap(value);
    }).model as dynamic;
    model.password = map["password"];
    return model;
  }

  String get modelString => "User";
}
