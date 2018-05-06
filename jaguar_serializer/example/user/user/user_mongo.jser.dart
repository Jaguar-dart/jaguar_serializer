// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mongo.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserMongoSerializer implements Serializer<User> {
  final _mongoId = const MongoId();
  final _dateTimeSerializer = const DateTimeSerializer();
  final _bookMongoSerializer = new BookMongoSerializer();

  @override
  Map<String, dynamic> toMap(User model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, '_id', _mongoId.serialize(model.id));
      setNullableValue(ret, 'email', model.email);
      setNullableValue(ret, 'N', model.name);
      setNullableValue(ret, 'dob', _dateTimeSerializer.serialize(model.dob));
      setNullableValue(
          ret,
          'book',
          _bookMongoSerializer.toMap(model.book,
              withType: withType, typeKey: typeKey));
      setNullableValue(ret, 'listStr',
          nullableIterableMapper(model.listStr, (val) => val as String));
      setNullableValue(
          ret,
          'listBook',
          nullableIterableMapper(
              model.listBook,
              (val) => _bookMongoSerializer.toMap(val as Book,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret, 'map', nullableMapMaker(model.map, (val) => val as String));
      setNullableValue(
          ret,
          'mapMap',
          nullableMapMaker(
              model.mapMap,
              (val) => nullableMapMaker(
                  val as Map<String, dynamic>, (val) => val as String)));
      setNullableValue(
          ret,
          'mapBook',
          nullableMapMaker(
              model.mapBook,
              (val) => _bookMongoSerializer.toMap(val as Book,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(ret, 'password', model.password);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  User fromMap(Map<String, dynamic> map, {User model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new User();
    obj.id = _mongoId.deserialize(map['_id'] as ObjectId);
    obj.email = map['email'] as String;
    obj.name = map['N'] as String;
    obj.dob = _dateTimeSerializer.deserialize(map['dob'] as String);
    obj.book =
        _bookMongoSerializer.fromMap(map['book'] as Map<String, dynamic>);
    obj.listStr = nullableIterableMapper<String>(
        map['listStr'] as Iterable, (val) => val as String);
    obj.listBook = nullableIterableMapper<Book>(map['listBook'] as Iterable,
        (val) => _bookMongoSerializer.fromMap(val as Map<String, dynamic>));
    obj.map = nullableMapMaker<String>(
        map['map'] as Map<String, dynamic>, (val) => val as String);
    obj.mapMap = nullableMapMaker<Map<String, String>>(
        map['mapMap'] as Map<String, dynamic>,
        (val) => nullableMapMaker<String>(
            val as Map<String, dynamic>, (val) => val as String));
    obj.mapBook = nullableMapMaker<Book>(map['mapBook'] as Map<String, dynamic>,
        (val) => _bookMongoSerializer.fromMap(val as Map<String, dynamic>));
    obj.password = map['password'] as String;
    return obj;
  }

  @override
  String modelString() => 'User';
}
