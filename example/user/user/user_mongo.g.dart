part of example.user.mongo;

abstract class _$UserMongoSerializer {
  User get _model;

  Map toMap() {
    Map map = new Map();

    map["_id"] = new MongoId(null).to(_model.id);
    map["email"] = _model.email;
    map["N"] = _model.name;

    return map;
  }

  void fromMap(Map map) {
    if(map is! Map) {
      return;
    }

    _model.id = new MongoId(null).from(map['_id']);
    _model.email = map['email'];
    _model.name = map['N'];
  }
}