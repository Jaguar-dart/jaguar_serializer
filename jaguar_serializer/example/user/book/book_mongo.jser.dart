// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_mongo.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookMongoSerializer implements Serializer<Book> {
  final _mongoId = const MongoId();

  @override
  Map<String, dynamic> toMap(Book model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, '_id', _mongoId.serialize(model.id));
      setNullableValue(ret, 'N', model.name);
      setNullableValue(ret, 'publishedYear', model.publishedYear);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Book fromMap(Map<String, dynamic> map, {Book model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Book();
    obj.id = _mongoId.deserialize(map['_id'] as ObjectId);
    obj.name = map['N'] as String;
    obj.publishedYear = map['publishedYear'] as int;
    return obj;
  }

  @override
  String modelString() => 'Book';
}
