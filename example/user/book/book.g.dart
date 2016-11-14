// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.book;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class BookViewSerializer
// **************************************************************************

abstract class _$BookViewSerializer implements MapSerializer {
  Book get model;

  Map toMap() {
    Map ret = new Map();
    ret["id"] = model.id;
    ret["name"] = model.name;
    ret["publishedYear"] = model.publishedYear;
    return ret;
  }

  Book fromMap(Map map) {
    if (map is! Map) {
      return null;
    }
    model.id = map["id"];
    model.name = map["name"];
    model.publishedYear = map["publishedYear"];
    return model;
  }
}
