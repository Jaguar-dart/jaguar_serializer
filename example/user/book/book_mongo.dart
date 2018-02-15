library example.book.mongo;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import '../../_common/mongo_serializer/import.dart';
import 'book.dart';

export 'book.dart' show Book;

part 'book_mongo.g.dart';

@GenSerializer(fields: const {
  'id': const EnDecode(alias: '_id', processor: const MongoId()),
  'name': const EnDecode(alias: 'N'),
  'viewSerializer': ignore,
})
class BookMongoSerializer extends Serializer<Book> with _$BookMongoSerializer {
}
