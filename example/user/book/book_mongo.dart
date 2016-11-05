library example.book.mongo;

import 'package:jaguar_serializer/src/map_serializer/import.dart';
import 'package:jaguar_serializer/src/mongo_serializer/import.dart';
import 'book.dart';

export 'book.dart' show Book;

part 'book_mongo.g.dart';

@GenSerializer()
@MongoId(#id)
@EnDecodeField(#name, asAndFrom: 'N')
class BookMongoSerializer extends Object
    with _$BookMongoSerializer, JsonMixin
    implements MapSerializer<Book> {
  final Book _model;

  BookMongoSerializer(this._model);

  BookMongoSerializer.FromMap(Map map) : _model = new Book() {
    fromMap(map);
  }

  Book get model => _model;
}

/*
abstract class _$BookMongoSerializer {
  Book get _model;

  Map toMap() => {
    "_id": new MongoId(null).to(_model.id),
    "name": _model.name,
    "publishedYear": _model.publishedYear,
  };

  void fromMap(Map map) {
    if(map is! Map) {
      return;
    }

    _model.id = new MongoId(null).from(map['_id']);
    _model.name = map['name'];
    _model.publishedYear = map['publishedYear'];
  }
}
 */
