// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.book.mongo;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class BookMongoSerializer
// **************************************************************************

abstract class _$BookMongoSerializer implements MapSerializer<Book> {
  Map toMap(Book model) {
    Map ret = new Map();
    ret["id"] = new MongoId(#id).to(model.id);
    ret["N"] = model.name;
    ret["publishedYear"] = model.publishedYear;
    return ret;
  }

  Book fromMap(Map map, {Book model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Book) {
      model = createModel();
    }
    model.id = new MongoId(#id).from(map["id"]);
    model.name = map["N"];
    model.publishedYear = map["publishedYear"];
    return model;
  }
}
