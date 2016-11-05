// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.book;

abstract class _$BookViewSerializer {
  Book get _model;

  Map toMap() => {
        "id": _model.id,
        "name": _model.name,
        "publishedYear": _model.publishedYear,
      };

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }

    _model.id = map["id"];
    _model.name = map['name'];
    _model.publishedYear = map['publishedYear'];
  }
}
