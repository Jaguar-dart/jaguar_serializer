part of example.user.mongo;

abstract class _$UserMongoSerializer {
  User get model;

  Map toMap() {
    Map map = new Map();

    map["_id"] = new MongoId(null).to(model.id);
    map["email"] = model.email;
    map["N"] = model.name;

    return map;
  }

  User fromMap(Map map) {
    if (map is! Map) {
      return null;
    }

    model.id = new MongoId(null).from(map['_id']);
    model.email = map['email'];
    model.name = map['N'];
    return model;
  }
}
