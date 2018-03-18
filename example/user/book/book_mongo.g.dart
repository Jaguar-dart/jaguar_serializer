// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.book.mongo;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookMongoSerializer implements Serializer<Book> {
  final _mongoId = const MongoId();

  Map<String, dynamic> toMap(Book model,
      {bool withType: false, String typeKey}) {
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

  Book fromMap(Map<String, dynamic> map, {Book model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Book) {
      model = new Book();
    }
    model.id = _mongoId.deserialize(map["_id"]);
    model.name = map["N"] as String;
    model.publishedYear = map["publishedYear"] as int;
    return model;
  }

  String modelString() => "Book";
}
