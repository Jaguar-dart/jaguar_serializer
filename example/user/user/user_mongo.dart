library example.user.mongo;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import '../../_common/mongo_serializer/import.dart';
import 'user.dart';
import '../book/book_mongo.dart';

export 'user.dart' show User;

part 'user_mongo.g.dart';

@GenSerializer(fields: const {
  'id': const EnDecode(alias: '_id', processor: const MongoId()),
  'name': const EnDecode(alias: 'N'),
  'dob': const EnDecode(processor: const DateTimeSerializer()),
  'viewSerializer': ignore
}, serializers: const [
  BookMongoSerializer,
])
class UserMongoSerializer extends Serializer<User> with _$UserMongoSerializer {}
