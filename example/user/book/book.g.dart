// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.book;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class BookViewSerializer
// **************************************************************************

abstract class _$BookViewSerializer implements Serializer<Book> {
  Map toMap(Book model, {bool withType: false, String typeKey}) {
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
    model.id = map["id"] ?? model.id;
    model.name = map["name"] ?? model.name;
    model.publishedYear = map["publishedYear"] ?? model.publishedYear;
    return model;
  }

  String modelString() => "Book";
}
