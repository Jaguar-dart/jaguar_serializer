// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserViewSerializer
// **************************************************************************

abstract class _$UserViewSerializer implements MapSerializer<User> {
  Map toMap(User model, {bool withTypeInfo: false}) {
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
        ret["Book"] = (getMapSerializerForType(Book) ??
                JaguarSerializer.getMapSerializerForType(Book))
            ?.toMap(model.book, withTypeInfo: withTypeInfo);
      }
      if (model.listStr != null) {
        ret["listStr"] = model.listStr
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (model.listBook != null) {
        ret["listBook"] = model.listBook
            ?.map((Book val) => val != null
                ? (getMapSerializerForType(Book) ??
                        JaguarSerializer.getMapSerializerForType(Book))
                    ?.toMap(val, withTypeInfo: withTypeInfo)
                : null)
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
          return (getMapSerializerForType(Book) ??
                  JaguarSerializer.getMapSerializerForType(Book))
              ?.toMap(value, withTypeInfo: withTypeInfo);
        }).model;
      }
      if (modelString != null && withTypeInfo) {
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
    model.id = map["Id"];
    model.email = map["Email"];
    model.name = map["N"];
    model.dob = new DateTimeSerializer(#dob).from(map["DoB"]);
    model.book = (getMapSerializerForType(Book) ??
            JaguarSerializer.getMapSerializerForType(Book))
        ?.fromMap(map["Book"]);
    model.listStr = map["listStr"]?.map((String val) => val)?.toList();
    model.listBook = map["listBook"]
        ?.map((dynamic val) => (getMapSerializerForType(Book) ??
                JaguarSerializer.getMapSerializerForType(Book))
            ?.fromMap(val))
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
      return (getMapSerializerForType(Book) ??
              JaguarSerializer.getMapSerializerForType(Book))
          ?.fromMap(value);
    }).model as dynamic;
    return model;
  }

  String get modelString => "User";
}
