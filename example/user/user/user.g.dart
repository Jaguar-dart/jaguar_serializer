// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserViewSerializer implements Serializer<User> {
  final DateTimeSerializer dobDateTimeSerializer = const DateTimeSerializer();
  final BookViewSerializer toBookViewSerializer = new BookViewSerializer();
  final BookViewSerializer fromBookViewSerializer = new BookViewSerializer();

  Map toMap(User model, {bool withType: false, String typeKey}) {
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
        ret["DoB"] = dobDateTimeSerializer.serialize(model.dob);
      }
      if (model.book != null) {
        ret["Book"] = toBookViewSerializer.toMap(model.book,
            withType: withType, typeKey: typeKey);
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
                    withType: withType, typeKey: typeKey)
                : null)
            ?.toList();
      }
      if (model.map != null) {
        ret["map"] =
            mapMaker(model.map, (String key) => key, (String value) => value);
      }
      if (model.mapMap != null) {
        ret["mapMap"] = mapMaker(
            model.mapMap,
            (String key) => key,
            (Map<String, String> value) =>
                mapMaker(value, (String key) => key, (String value) => value));
      }
      if (model.mapBook != null) {
        ret["mapBook"] = mapMaker(
            model.mapBook,
            (String key) => key,
            (Book value) => toBookViewSerializer.toMap(value,
                withType: withType, typeKey: typeKey));
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  User fromMap(Map map, {User model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! User) {
      model = createModel();
    }
    model.id = map["Id"];
    model.email = map["Email"];
    model.name = map["N"];
    model.dob = dobDateTimeSerializer.deserialize(map["DoB"]);
    model.book = fromBookViewSerializer.fromMap(map["Book"], typeKey: typeKey);
    model.listStr = map["listStr"]?.map((String val) => val)?.toList();
    model.listBook = map["listBook"]
        ?.map(
            (Map val) => fromBookViewSerializer.fromMap(val, typeKey: typeKey))
        ?.toList();
    model.map =
        mapMaker(map["map"], (String key) => key, (String value) => value)
            as dynamic;
    model.mapMap = mapMaker(
        map["mapMap"],
        (String key) => key,
        (Map<String, String> value) =>
            mapMaker(value, (String key) => key, (String value) => value)
                as dynamic) as dynamic;
    model.mapBook = mapMaker(
        map["mapBook"],
        (String key) => key,
        (Map value) =>
            fromBookViewSerializer.fromMap(value, typeKey: typeKey)) as dynamic;
    return model;
  }

  String modelString() => "User";
}
