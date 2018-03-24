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
          nullableIterableMapper(model.listStr, (val) => val as String));
      setNullableValue(
          ret,
          "listBook",
          nullableIterableMapper(
              model.listBook,
              (val) => _bookViewSerializer.toMap(val as Book,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret, "map", nullableMapMaker(model.map, (val) => val as String));
      setNullableValue(
          ret,
          "mapMap",
          nullableMapMaker(
              model.mapMap,
              (val) => nullableMapMaker(
                  val as Map<String, dynamic>, (val) => val as String)));
      setNullableValue(
          ret,
          "mapBook",
          nullableMapMaker(
              model.mapBook,
              (val) => _bookViewSerializer.toMap(val as Book,
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
    model.dob = _dateTimeSerializer.deserialize(map["DoB"] as String);
    model.book = _bookViewSerializer
        .fromMap(map["Book"] as Map<String, dynamic>, typeKey: typeKey);
    model.listStr = nullableIterableMapper<String>(
        map["listStr"] as Iterable, (val) => val as String);
    model.listBook = nullableIterableMapper<Book>(
        map["listBook"] as Iterable,
        (val) => _bookViewSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.map = nullableMapMaker<String>(
        map["map"] as Map<String, dynamic>, (val) => val as String);
    model.mapMap = nullableMapMaker<Map<String, String>>(
        map["mapMap"] as Map<String, dynamic>,
        (val) => nullableMapMaker<String>(
            val as Map<String, dynamic>, (val) => val as String));
    model.mapBook = nullableMapMaker<Book>(
        map["mapBook"] as Map<String, dynamic>,
        (val) => _bookViewSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    return model;
  }

  String modelString() => "User";
}
