// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.book;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookViewSerializer implements Serializer<Book> {
  Map toMap(Book model, {bool withType: false, String typeKey}) {
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

  Book fromMap(Map map, {Book model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Book) {
      model = new Book();
    }
    model.id = map["id"];
    model.name = map["name"];
    model.publishedYear = map["publishedYear"];
    return model;
  }

  String modelString() => "Book";
}
