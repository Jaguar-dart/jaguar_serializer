part of example.book.mongo;

abstract class _$BookMongoSerializer {
  Book get _model;

  Map toMap() => {
        "_id": new MongoId(null).to(_model.id),
        "name": _model.name,
        "publishedYear": _model.publishedYear,
      };

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }

    _model.id = new MongoId(null).from(map['_id']);
    _model.name = map['name'];
    _model.publishedYear = map['publishedYear'];
  }
}
