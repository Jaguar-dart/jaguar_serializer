// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserViewSerializer implements Serializer<User> {
  final _dateTimeSerializer = const DateTimeSerializer();
  final _bookViewSerializer = new BookViewSerializer();

  Map<String, dynamic> toMap(User model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "Id", model.id);
      setNullableValue(ret, "Email", model.email);
      setNullableValue(ret, "N", model.name);
      setNullableValue(ret, "DoB", _dateTimeSerializer.serialize(model.dob));
      setNullableValue(
          ret,
          "Book",
          _bookViewSerializer.toMap(model.book,
              withType: withType, typeKey: typeKey));
      setNullableValue(ret, "listStr",
          nullableIterableMapper<String>(model.listStr, (String val) => val));
      setNullableValue(
          ret,
          "listBook",
          nullableIterableMapper<Book>(
              model.listBook,
              (Book val) => _bookViewSerializer.toMap(val,
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
              (Book value) => _bookViewSerializer.toMap(value,
                  withType: withType, typeKey: typeKey)));
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
    model.id = map["Id"] as String;
    model.email = map["Email"] as String;
    model.name = map["N"] as String;
    model.dob = _dateTimeSerializer.deserialize(map["DoB"]);
    model.book = _bookViewSerializer
        .fromMap(map["Book"] as Map<String, dynamic>, typeKey: typeKey);
    model.listStr = nullableIterableMapper<String>(
        map["listStr"], (listValue) => listValue);
    model.listBook = nullableIterableMapper<Map>(
        map["listBook"],
        (listValue) => _bookViewSerializer
            .fromMap(listValue as Map<String, dynamic>, typeKey: typeKey));
    model.map = nullableMapMaker<String>(map["map"], (mapValue) => mapValue);
    model.mapMap = nullableMapMaker<Map<String, String>>(
        map["mapMap"],
        (mapValue) =>
            nullableMapMaker<String>(mapValue, (mapValue) => mapValue));
    model.mapBook = nullableMapMaker<Map>(
        map["mapBook"],
        (mapValue) => _bookViewSerializer
            .fromMap(mapValue as Map<String, dynamic>, typeKey: typeKey));
    return model;
  }

  String modelString() => "User";
}
