// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookViewSerializer implements Serializer<Book> {
  Map<String, dynamic> toMap(Book model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "id", model.id);
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "publishedYear", model.publishedYear);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Book fromMap(Map<String, dynamic> map, {Book model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Book) {
      model = new Book();
    }
    model.id = map["id"] as String;
    model.name = map["name"] as String;
    model.publishedYear = map["publishedYear"] as int;
    return model;
  }

  String modelString() => "Book";
}
