library example.user.mongo;

import 'package:jaguar_serializer/src/map_serializer/import.dart';
import 'package:jaguar_serializer/src/mongo_serializer/import.dart';
import 'user.dart';

export 'user.dart' show User;

part 'user_mongo.g.dart';

@GenSerializer()
@MongoId(#id)
@EnDecodeField(#name, fromAndAs: 'N')
class UserMongoSerializer extends Object
    with _$UserMongoSerializer, JsonMixin
    implements MapSerializer<User> {
  final User _model;

  UserMongoSerializer(this._model);

  UserMongoSerializer.FromMap(Map map) : _model = new User() {
    fromMap(map);
  }

  User get model => _model;
}

/*
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
 */