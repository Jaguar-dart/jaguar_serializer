// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.book;

abstract class _$BookViewSerializer {
  Book get model;

  Map toMap() => {
        "id": model.id,
        "name": model.name,
        "publishedYear": model.publishedYear,
      };

  Book fromMap(Map map) {
    if (map is! Map) {
      return null;
    }

    model.id = map["id"];
    model.name = map['name'];
    model.publishedYear = map['publishedYear'];

    return model;
  }
}
