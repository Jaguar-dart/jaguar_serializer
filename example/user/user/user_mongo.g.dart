// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.user.mongo;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserMongoSerializer implements Serializer<User> {
  final _mongoId = const MongoId();
  final _dateTimeSerializer = const DateTimeSerializer();
  final _bookMongoSerializer = new BookMongoSerializer();

  Map<String, dynamic> toMap(User model,
      {bool withType: false, String typeKey}) {
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

  User fromMap(Map<String, dynamic> map, {User model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! User) {
      model = new User();
    }
    model.id = _mongoId.deserialize(map["_id"]);
    model.email = map["email"] as String;
    model.name = map["N"] as String;
    model.dob = _dateTimeSerializer.deserialize(map["dob"]);
    model.book = _bookMongoSerializer
        .fromMap(map["book"] as Map<String, dynamic>, typeKey: typeKey);
    model.listStr = nullableIterableMapper<String>(
        map["listStr"], (listValue) => listValue);
    model.listBook = nullableIterableMapper<Map>(
        map["listBook"],
        (listValue) => _bookMongoSerializer
            .fromMap(listValue as Map<String, dynamic>, typeKey: typeKey));
    model.map = nullableMapMaker<String>(map["map"], (mapValue) => mapValue);
    model.mapMap = nullableMapMaker<Map<String, String>>(
        map["mapMap"],
        (mapValue) =>
            nullableMapMaker<String>(mapValue, (mapValue) => mapValue));
    model.mapBook = nullableMapMaker<Map>(
        map["mapBook"],
        (mapValue) => _bookMongoSerializer
            .fromMap(mapValue as Map<String, dynamic>, typeKey: typeKey));
    model.password = map["password"] as String;
    return model;
  }

  String modelString() => "User";
}
