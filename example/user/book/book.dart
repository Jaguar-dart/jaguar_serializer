library example.model.book;

import 'package:serialize/src/map_serializer/import.dart';
import 'package:serialize/src/view_serializer/import.dart';

part 'book.g.dart';

@MakeSerializer()
class BookViewSerializer extends Object
    with _$BookViewSerializer, JsonMixin
    implements MapSerializer<Book> {
  final Book _model;

  BookViewSerializer(this._model);

  BookViewSerializer.FromMap(Map map) : _model = new Book() {
    fromMap(map);
  }

  Book get model => _model;
}

class Book extends Object
    implements SerializableToView {
  String id;

  String name;

  int publishedYear;

  BookViewSerializer get viewSerializer => new BookViewSerializer(this);
}
