// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserViewSerializer implements Serializer<User> {
  final _dateTimeSerializer = const DateTimeSerializer();
  final _bookViewSerializer = new BookViewSerializer();

  @override
  Map<String, dynamic> toMap(User model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'Id', model.id);
      setNullableValue(ret, 'Email', model.email);
      setNullableValue(ret, 'N', model.name);
      setNullableValue(ret, 'DoB', _dateTimeSerializer.serialize(model.dob));
      setNullableValue(
          ret,
          'Book',
          _bookViewSerializer.toMap(model.book,
              withType: withType, typeKey: typeKey));
      setNullableValue(ret, 'listStr',
          nullableIterableMapper(model.listStr, (val) => val as String));
      setNullableValue(
          ret,
          'listBook',
          nullableIterableMapper(
              model.listBook,
              (val) => _bookViewSerializer.toMap(val as Book,
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
              (val) => _bookViewSerializer.toMap(val as Book,
                  withType: withType, typeKey: typeKey)));
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
    obj.id = map['Id'] as String;
    obj.email = map['Email'] as String;
    obj.name = map['N'] as String;
    obj.dob = _dateTimeSerializer.deserialize(map['DoB'] as String);
    obj.book = _bookViewSerializer.fromMap(map['Book'] as Map<String, dynamic>);
    obj.listStr = nullableIterableMapper<String>(
        map['listStr'] as Iterable, (val) => val as String);
    obj.listBook = nullableIterableMapper<Book>(map['listBook'] as Iterable,
        (val) => _bookViewSerializer.fromMap(val as Map<String, dynamic>));
    obj.map = nullableMapMaker<String>(
        map['map'] as Map<String, dynamic>, (val) => val as String);
    obj.mapMap = nullableMapMaker<Map<String, String>>(
        map['mapMap'] as Map<String, dynamic>,
        (val) => nullableMapMaker<String>(
            val as Map<String, dynamic>, (val) => val as String));
    obj.mapBook = nullableMapMaker<Book>(map['mapBook'] as Map<String, dynamic>,
        (val) => _bookViewSerializer.fromMap(val as Map<String, dynamic>));
    return obj;
  }

  @override
  String modelString() => 'User';
}
