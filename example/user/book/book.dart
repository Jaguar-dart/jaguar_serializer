library example.model.book;

import 'package:jaguar_serializer/serializer.dart';

part 'book.g.dart';

@GenSerializer(
  ignore: const ['viewSerializer'],
)
class BookViewSerializer extends Serializer<Book> with _$BookViewSerializer {
  Book createModel() => new Book();

  BookViewSerializer();

  BookViewSerializer.FromMap(Map map) {
    fromMap(map);
  }
}

class Book {
  String id;

  String name;

  int publishedYear;

  static BookViewSerializer viewSerializer = new BookViewSerializer();
}
