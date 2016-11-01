part of example.user.mongo;

abstract class _$UserMongoSerializer {
  User get _model;

  Map toMap() => {
    "_id": new MongoId(null).to(_model.id),
    "email": _model.email,
    "N": _model.name,
  };

  void fromMap(Map map) {
    if(map is! Map) {
      return;
    }

    _model.id = new MongoId(null).from(map['_id']);
    _model.email = map['email'];
    _model.name = map['N'];
  }
}