// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserViewSerializer implements Serializer<User> {
  final _dateTimeSerializer = const DateTimeSerializer();
  final _bookViewSerializer = new BookViewSerializer();

  Map toMap(User model, {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNonNullableValue(ret, "Id", model.id);
      setNonNullableValue(ret, "Email", model.email);
      setNonNullableValue(ret, "N", model.name);
      setNonNullableValue(ret, "DoB", _dateTimeSerializer.serialize(model.dob));
      setNonNullableValue(
          ret,
          "Book",
          _bookViewSerializer.toMap(model.book,
              withType: withType, typeKey: typeKey));
      setNonNullableValue(ret, "listStr",
          safeIterableMapper<String>(model.listStr, (String val) => val));
      setNonNullableValue(
          ret,
          "listBook",
          safeIterableMapper<Book>(
              model.listBook,
              (Book val) => _bookViewSerializer.toMap(val,
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
              (Book value) => _bookViewSerializer.toMap(value,
                  withType: withType, typeKey: typeKey)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
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
    model.dob = _dateTimeSerializer.deserialize(map["DoB"]);
    model.book = _bookViewSerializer.fromMap(map["Book"], typeKey: typeKey);
    model.listStr =
        safeIterableMapper<String>(map["listStr"], (String val) => val);
    model.listBook = safeIterableMapper<Map>(map["listBook"],
        (Map val) => _bookViewSerializer.fromMap(val, typeKey: typeKey));
    model.map = mapMaker<String, String>(
        map["map"], (String key) => key, (String value) => value);
    model.mapMap = mapMaker<String, Map<String, String>>(
        map["mapMap"],
        (String key) => key,
        (Map<String, String> value) => mapMaker<String, String>(
            value, (String key) => key, (String value) => value));
    model.mapBook = mapMaker<String, Map>(map["mapBook"], (String key) => key,
        (Map value) => _bookViewSerializer.fromMap(value, typeKey: typeKey));
    return model;
  }

  String modelString() => "User";
}
