// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.user.mongo;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserMongoSerializer
// **************************************************************************

abstract class _$UserMongoSerializer implements MapSerializer<User> {
  Map toMap(User model) {
    Map ret = new Map();
    ret["id"] = new MongoId(#id).to(model.id);
    ret["email"] = model.email;
    ret["N"] = model.name;
    ret["dob"] = new DateTimeSerializer(#dob).to(model.dob);
    ret["book"] = new BookMongoSerializer().toMap(model.book);
    ret["listStr"] =
        model.listStr?.map((String val) => val != null ? val : null)?.toList();
    ret["listBook"] = model.listBook
        ?.map((Book val) =>
            val != null ? new BookMongoSerializer().toMap(val) : null)
        ?.toList();
    ret["map"] = new MapMaker(model.map, (String key) => key, (String value) {
      return value;
    }).model;
    ret["mapMap"] = new MapMaker(model.mapMap, (String key) => key,
        (Map<String, String> value) {
      return new MapMaker(value, (String key) => key, (String value) {
        return value;
      }).model;
    }).model;
    ret["mapBook"] =
        new MapMaker(model.mapBook, (String key) => key, (Book value) {
      return new BookMongoSerializer().toMap(value);
    }).model;
    ret["passwordHash"] = model.passwordHash;
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
    model.book = new BookMongoSerializer().fromMap(map["book"]);
    model.listStr =
        (map["listStr"] as List<String>)?.map((String val) => val)?.toList();
    model.listBook = (map["listBook"] as List<Map>)
        ?.map((Map val) => new BookMongoSerializer().fromMap(val))
        ?.toList();
    model.map = new MapMaker(
        map["map"] as Map<String, String>, (String key) => key, (String value) {
      return value;
    }).model;
    model.mapMap = new MapMaker(
        map["mapMap"] as Map<String, Map<String, String>>, (String key) => key,
        (Map<String, String> value) {
      return new MapMaker(value as Map<String, String>, (String key) => key,
          (String value) {
        return value;
      }).model;
    }).model;
    model.mapBook = new MapMaker(
        map["mapBook"] as Map<String, Map>, (String key) => key, (Map value) {
      return new BookMongoSerializer().fromMap(value);
    }).model;
    model.password = map["password"];
    return model;
  }
}
