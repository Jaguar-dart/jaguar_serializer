part of example.book.mongo;

abstract class _$BookMongoSerializer {
  Book get model;

  Map toMap() => {
        "_id": new MongoId(#_id).to(model.id),
        "name": model.name,
        "publishedYear": model.publishedYear,
      };

  Book fromMap(Map map) {
    if (map is! Map) {
      return null;
    }

    model.id = new MongoId(null).from(map['_id']);
    model.name = map['name'];
    model.publishedYear = map['publishedYear'];
    return model;
  }
}
