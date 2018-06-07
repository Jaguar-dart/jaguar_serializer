// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookViewSerializer implements Serializer<Book> {
  @override
  Map<String, dynamic> toMap(Book model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'id', model.id);
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'publishedYear', model.publishedYear);
    }
    return ret;
  }

  @override
  Book fromMap(Map map, {Book model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Book();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    obj.publishedYear = map['publishedYear'] as int;
    return obj;
  }
}
