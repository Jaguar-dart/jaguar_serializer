// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserViewSerializer
// **************************************************************************

abstract class _$UserViewSerializer implements MapSerializer<User> {
  Map toMap(User model) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["Id"] = model.id;
      }
      if (model.email != null) {
        ret["Email"] = model.email;
      }
      if (model.name != null) {
        ret["N"] = model.name;
      }
      if (model.dob != null) {
        ret["DoB"] = new DateTimeSerializer(#dob).to(model.dob);
      }
      if (model.book != null) {
        ret["Book"] = new BookViewSerializer().toMap(model.book);
      }
      if (model.listStr != null) {
        ret["listStr"] = model.listStr
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (model.listBook != null) {
        ret["listBook"] = model.listBook
            ?.map((Book val) =>
                val != null ? new BookViewSerializer().toMap(val) : null)
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
          return new BookViewSerializer().toMap(value);
        }).model;
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
