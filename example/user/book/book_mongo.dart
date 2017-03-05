library example.book.mongo;

import 'package:jaguar_serializer/serializer.dart';
import '../../_common/mongo_serializer/import.dart';
import 'book.dart';

export 'book.dart' show Book;

part 'book_mongo.g.dart';

@GenSerializer()
@MongoId(#id)
@EnDecodeField(#name, asAndFrom: 'N')
@IgnoreField(#viewSerializer)
class BookMongoSerializer extends Serializer<Book> with _$BookMongoSerializer {
  Book createModel() => new Book();

  BookMongoSerializer();
}

/*
abstract class _$BookMongoSerializer {
  Book get _model;

  Map toMap() => {
    "_id": new MongoId(null).serialize(_model.id),
    "name": _model.name,
    "publishedYear": _model.publishedYear,
  };

  void fromMap(Map map) {
    if(map is! Map) {
      return;
    }

    _model.id = new MongoId(null).deserialize(map['_id']);
    _model.name = map['name'];
    _model.publishedYear = map['publishedYear'];
  }
}
 */
