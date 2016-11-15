// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserViewSerializer
// **************************************************************************

abstract class _$UserViewSerializer implements MapSerializer<User> {
  Map toMap(User model) {
    Map ret = new Map();
    ret["Id"] = model.id;
    ret["Email"] = model.email;
    ret["N"] = model.name;
    ret["DoB"] = new DateTimeSerializer(#dob).to(model.dob);
    ret["Book"] = new BookViewSerializer().toMap(model.book);
    ret["listStr"] =
        model.listStr?.map((String val) => val != null ? val : null)?.toList();
    ret["listBook"] = model.listBook
        ?.map((Book val) =>
            val != null ? new BookViewSerializer().toMap(val) : null)
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
      return new BookViewSerializer().toMap(value);
    }).model;
    return ret;
  }

  User fromMap(Map map, {User model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! User) {
      model = createModel();
    }
    model.id = map["Id"];
    model.email = map["Email"];
    model.name = map["N"];
    model.dob = new DateTimeSerializer(#dob).from(map["DoB"]);
    model.book = new BookViewSerializer().fromMap(map["Book"]);
    model.listStr =
        (map["listStr"] as List<String>)?.map((String val) => val)?.toList();
    model.listBook = (map["listBook"] as List<Map>)
        ?.map((Map val) => new BookViewSerializer().fromMap(val))
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
      return new BookViewSerializer().fromMap(value);
    }).model;
    return model;
  }
}
