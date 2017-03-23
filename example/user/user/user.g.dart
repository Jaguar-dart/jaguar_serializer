// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserViewSerializer
// **************************************************************************

abstract class _$UserViewSerializer implements Serializer<User> {
  final BookViewSerializer toBookViewSerializer = new BookViewSerializer();
  final BookViewSerializer fromBookViewSerializer = new BookViewSerializer();

  Map toMap(User model, {bool withTypeInfo: false, String typeInfoKey}) {
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
        ret["DoB"] = new DateTimeSerializer(#dob).serialize(model.dob);
      }
      if (model.book != null) {
        ret["Book"] = toBookViewSerializer.toMap(model.book,
            withTypeInfo: withTypeInfo, typeInfoKey: typeInfoKey);
      }
      if (model.listStr != null) {
        ret["listStr"] = model.listStr
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (model.listBook != null) {
        ret["listBook"] = model.listBook
            ?.map((Book val) => val != null
                ? toBookViewSerializer.toMap(val,
                    withTypeInfo: withTypeInfo, typeInfoKey: typeInfoKey)
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
          return toBookViewSerializer.toMap(value,
              withTypeInfo: withTypeInfo, typeInfoKey: typeInfoKey);
        }).model;
      }
      if (modelString() != null && withTypeInfo) {
        ret[typeInfoKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  User fromMap(Map map, {User model, String typeInfoKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! User) {
      model = createModel();
    }
    model.id = map["Id"];
    model.email = map["Email"];
    model.name = map["N"];
    model.dob = new DateTimeSerializer(#dob).deserialize(map["DoB"]);
    model.book =
        fromBookViewSerializer.fromMap(map["Book"], typeInfoKey: typeInfoKey);
    model.listStr = map["listStr"]?.map((String val) => val)?.toList();
    model.listBook = map["listBook"]
        ?.map((Map val) =>
            fromBookViewSerializer.fromMap(val, typeInfoKey: typeInfoKey))
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
        new MapMaker(map["mapBook"], (String key) => key, (Map value) {
      return fromBookViewSerializer.fromMap(value, typeInfoKey: typeInfoKey);
    }).model as dynamic;
    return model;
  }

  String modelString() => "User";
}
