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
      setNullableValue(ret, "_id", _mongoId.serialize(model.id));
      setNullableValue(ret, "email", model.email);
      setNullableValue(ret, "N", model.name);
      setNullableValue(ret, "dob", _dateTimeSerializer.serialize(model.dob));
      setNullableValue(
          ret,
          "book",
          _bookMongoSerializer.toMap(model.book,
              withType: withType, typeKey: typeKey));
      setNullableValue(ret, "listStr",
          nullableIterableMapper<String>(model.listStr, (String val) => val));
      setNullableValue(
          ret,
          "listBook",
          nullableIterableMapper<Book>(
              model.listBook,
              (Book val) => _bookMongoSerializer.toMap(val,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(ret, "map",
          nullableMapMaker<String>(model.map, (String value) => value));
      setNullableValue(
          ret,
          "mapMap",
          nullableMapMaker<Map<String, String>>(
              model.mapMap,
              (Map<String, String> value) =>
                  nullableMapMaker<String>(value, (String value) => value)));
      setNullableValue(
          ret,
          "mapBook",
          nullableMapMaker<Book>(
              model.mapBook,
              (Book value) => _bookMongoSerializer.toMap(value,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(ret, "password", model.password);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  User fromMap(Map map, {User model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! User) {
      model = new User();
    }
    model.id = _mongoId.deserialize(map["_id"]);
    model.email = map["email"];
    model.name = map["N"];
    model.dob = _dateTimeSerializer.deserialize(map["dob"]);
    model.book = _bookMongoSerializer.fromMap(map["book"], typeKey: typeKey);
    model.listStr =
        nullableIterableMapper<String>(map["listStr"], (String val) => val);
    model.listBook = nullableIterableMapper<Map>(map["listBook"],
        (Map val) => _bookMongoSerializer.fromMap(val, typeKey: typeKey));
    model.map = nullableMapMaker<String>(map["map"], (String value) => value);
    model.mapMap = nullableMapMaker<Map<String, String>>(
        map["mapMap"],
        (Map<String, String> value) =>
            nullableMapMaker<String>(value, (String value) => value));
    model.mapBook = nullableMapMaker<Map>(map["mapBook"],
        (Map value) => _bookMongoSerializer.fromMap(value, typeKey: typeKey));
    model.password = map["password"];
    return model;
  }

  String modelString() => "User";
}
