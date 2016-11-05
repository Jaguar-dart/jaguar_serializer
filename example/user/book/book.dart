library example.model.book;

import 'package:jaguar_serializer/src/map_serializer/import.dart';
import 'package:jaguar_serializer/src/view_serializer/import.dart';

part 'book.g.dart';

@GenSerializer()
class BookViewSerializer extends Object
    with _$BookViewSerializer, JsonMixin
    implements MapSerializer<Book> {
  final Book _model;

  BookViewSerializer([Book model]) : _model = model ?? new Book();

  BookViewSerializer.FromMap(Map map) : _model = new Book() {
    fromMap(map);
  }

  Book get model => _model;
}

class Book extends Object implements SerializableToView {
  String id;

  String name;

  int publishedYear;

  BookViewSerializer get viewSerializer => new BookViewSerializer(this);
}

/*
abstract class _$BookViewSerializer {
  Book get _model;

  Map toMap() => {
    "id": _model.id,
    "name": _model.name,
    "publishedYear": _model.publishedYear,
  };

  void fromMap(Map map) {
    if(map is! Map) {
      return;
    }

    _model.id = map["id"];
    _model.name = map['name'];
    _model.publishedYear = map['publishedYear'];
  }
}
 */
