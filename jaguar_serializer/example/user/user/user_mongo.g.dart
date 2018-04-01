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
          nullableIterableMapper(model.listStr, (val) => val as String));
      setNullableValue(
          ret,
          "listBook",
          nullableIterableMapper(
              model.listBook,
              (val) => _bookMongoSerializer.toMap(val as Book,
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
              (val) => _bookMongoSerializer.toMap(val as Book,
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
    model.id = _mongoId.deserialize(map["_id"] as ObjectId);
    model.email = map["email"] as String;
    model.name = map["N"] as String;
    model.dob = _dateTimeSerializer.deserialize(map["dob"] as String);
    model.book = _bookMongoSerializer
        .fromMap(map["book"] as Map<String, dynamic>, typeKey: typeKey);
    model.listStr = nullableIterableMapper<String>(
        map["listStr"] as Iterable, (val) => val as String);
    model.listBook = nullableIterableMapper<Book>(
        map["listBook"] as Iterable,
        (val) => _bookMongoSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.map = nullableMapMaker<String>(
        map["map"] as Map<String, dynamic>, (val) => val as String);
    model.mapMap = nullableMapMaker<Map<String, String>>(
        map["mapMap"] as Map<String, dynamic>,
        (val) => nullableMapMaker<String>(
            val as Map<String, dynamic>, (val) => val as String));
    model.mapBook = nullableMapMaker<Book>(
        map["mapBook"] as Map<String, dynamic>,
        (val) => _bookMongoSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.password = map["password"] as String;
    return model;
  }

  String modelString() => "User";
}
