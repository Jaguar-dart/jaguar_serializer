library example.book.mongo;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import '../../_common/mongo_serializer/import.dart';
import 'book.dart';

export 'book.dart' show Book;

part 'book_mongo.g.dart';

@GenSerializer(fields: const {
  'id': const [const EnDecode('_id')],
  'name': const [const EnDecode('N')],
  'viewSerializer': const [ignore],
}, processors: const {
  'id': const MongoId(),
})
class BookMongoSerializer extends Serializer<Book> with _$BookMongoSerializer {
  Book createModel() => new Book();

  BookMongoSerializer();
}
