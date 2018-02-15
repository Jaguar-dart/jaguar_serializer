// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.book.mongo;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookMongoSerializer implements Serializer<Book> {
  final _mongoId = const MongoId();

  Map toMap(Book model, {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "_id", _mongoId.serialize(model.id));
      setNullableValue(ret, "N", model.name);
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
    model.id = _mongoId.deserialize(map["_id"]);
    model.name = map["N"];
    model.publishedYear = map["publishedYear"];
    return model;
  }

  String modelString() => "Book";
}
