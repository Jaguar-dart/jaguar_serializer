// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.book;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class BookViewSerializer
// **************************************************************************

abstract class _$BookViewSerializer implements MapSerializer<Book> {
  Map toMap(Book model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = model.id;
      }
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.publishedYear != null) {
        ret["publishedYear"] = model.publishedYear;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
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
    model.id = map["id"];
    model.name = map["name"];
    model.publishedYear = map["publishedYear"];
    return model;
  }

  String get modelString => "Book";
}
