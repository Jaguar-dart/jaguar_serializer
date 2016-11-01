part of example.model.user;

abstract class _$UserViewSerializer {
  User get _model;

  Map toMap() => {
    "email": _model.email,
    "N": _model.name,
  };

  void fromMap(Map map) {
    _model.email = map['email'];
    _model.name = map['N'];
  }
}