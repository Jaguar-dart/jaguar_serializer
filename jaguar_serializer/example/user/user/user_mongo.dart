import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../../_common/mongo_serializer/import.dart';
import 'user.dart';
import '../book/book_mongo.dart';

export 'user.dart' show User;

part 'user_mongo.jser.dart';

@GenSerializer(fields: const {
  'id': const EnDecode<String>(alias: '_id', processor: const MongoId()),
  'name': const EnDecode<String>(alias: 'N'),
  'dob': const EnDecode<DateTime>(processor: const DateTimeSerializer()),
  'viewSerializer': ignore
}, serializers: const [
  BookMongoSerializer,
])
class UserMongoSerializer extends Serializer<User> with _$UserMongoSerializer {}
