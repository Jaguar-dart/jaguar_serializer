// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.user.mongo;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserMongoSerializer implements Serializer<User> {
  final _mongoId = const MongoId();
  final _dateTimeSerializer = const DateTimeSerializer();
  final _bookMongoSerializer = new BookMongoSerializer();

  Map toMap(User model, {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNonNullableValue(ret, "_id", _mongoId.serialize(model.id));
      setNonNullableValue(ret, "email", model.email);
      setNonNullableValue(ret, "N", model.name);
      setNonNullableValue(ret, "dob", _dateTimeSerializer.serialize(model.dob));
      setNonNullableValue(
          ret,
          "book",
          _bookMongoSerializer.toMap(model.book,
              withType: withType, typeKey: typeKey));
      setNonNullableValue(ret, "listStr",
          safeIterableMapper<String>(model.listStr, (String val) => val));
      setNonNullableValue(
          ret,
          "listBook",
          safeIterableMapper<Book>(
              model.listBook,
              (Book val) => _bookMongoSerializer.toMap(val,
                  withType: withType, typeKey: typeKey)));
      setNonNullableValue(
          ret,
          "map",
          mapMaker<String, String>(
              model.map, (String key) => key, (String value) => value));
      setNonNullableValue(
          ret,
          "mapMap",
          mapMaker<String, Map<String, String>>(
              model.mapMap,
              (String key) => key,
              (Map<String, String> value) => mapMaker<String, String>(
                  value, (String key) => key, (String value) => value)));
      setNonNullableValue(
          ret,
          "mapBook",
          mapMaker<String, Book>(
              model.mapBook,
              (String key) => key,
              (Book value) => _bookMongoSerializer.toMap(value,
                  withType: withType, typeKey: typeKey)));
      setNonNullableValue(ret, "password", model.password);
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
    model.id = _mongoId.deserialize(map["_id"]);
    model.email = map["email"];
    model.name = map["N"];
    model.dob = _dateTimeSerializer.deserialize(map["dob"]);
    model.book = _bookMongoSerializer.fromMap(map["book"], typeKey: typeKey);
    model.listStr =
        safeIterableMapper<String>(map["listStr"], (String val) => val);
    model.listBook = safeIterableMapper<Map>(map["listBook"],
        (Map val) => _bookMongoSerializer.fromMap(val, typeKey: typeKey));
    model.map = mapMaker<String, String>(
        map["map"], (String key) => key, (String value) => value);
    model.mapMap = mapMaker<String, Map<String, String>>(
        map["mapMap"],
        (String key) => key,
        (Map<String, String> value) => mapMaker<String, String>(
            value, (String key) => key, (String value) => value));
    model.mapBook = mapMaker<String, Map>(map["mapBook"], (String key) => key,
        (Map value) => _bookMongoSerializer.fromMap(value, typeKey: typeKey));
    model.password = map["password"];
    return model;
  }

  String modelString() => "User";
}
