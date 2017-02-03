// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.book.mongo;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class BookMongoSerializer
// **************************************************************************

abstract class _$BookMongoSerializer implements MapSerializer<Book> {
  Map toMap(Book model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = new MongoId(#id).to(model.id);
      }
      if (model.name != null) {
        ret["N"] = model.name;
      }
      if (model.publishedYear != null) {
        ret["publishedYear"] = model.publishedYear;
      }
      if (modelString != null && withTypeInfo) {
        ret["@t"] = modelString;
      }
    }
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

  String get modelString => "Book";
}
