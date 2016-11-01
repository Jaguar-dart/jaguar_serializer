library example.user.mongo;

import 'package:serialize/src/map_serializer/import.dart';
import 'package:serialize/src/mongo_serializer/import.dart';
import 'user.dart';

export 'user.dart' show User;

part 'user_mongo.g.dart';

@MakeSerializer()
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

