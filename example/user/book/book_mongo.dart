library example.book.mongo;

import 'package:serialize/src/map_serializer/import.dart';
import 'package:serialize/src/mongo_serializer/import.dart';
import 'book.dart';

export 'book.dart' show Book;

part 'book_mongo.g.dart';

@MakeSerializer()
@MongoId(#id)
@EnDecodeField(#name, fromAndAs: 'N')
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

