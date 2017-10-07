library example.user.mongo;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import '../../_common/mongo_serializer/import.dart';
import 'user.dart';
import '../book/book_mongo.dart';

export 'user.dart' show User;

part 'user_mongo.g.dart';

@GenSerializer(processors: const {
  'id': const MongoId(),
  'dob': const DateTimeSerializer(),
}, fields: const {
  'name': const [const EnDecode('N')],
  'viewSerializer': const [const Ignore()],
}, serializers: const [
  BookMongoSerializer,
])
class UserMongoSerializer extends Serializer<User> with _$UserMongoSerializer {
  User createModel() => new User();

  UserMongoSerializer();

  factory UserMongoSerializer.FromMap(Map map) =>
      new UserMongoSerializer()..fromMap(map);
}
