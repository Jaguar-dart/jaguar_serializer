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
      setNonNullableValue(ret, "_id", _mongoId.serialize(model.id));
      setNonNullableValue(ret, "N", model.name);
      setNonNullableValue(ret, "publishedYear", model.publishedYear);
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Book fromMap(Map map, {Book model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Book) {
      model = createModel();
    }
    model.id = _mongoId.deserialize(map["_id"]);
    model.name = map["N"];
    model.publishedYear = map["publishedYear"];
    return model;
  }

  String modelString() => "Book";
}
