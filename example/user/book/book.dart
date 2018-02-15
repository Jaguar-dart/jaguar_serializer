library example.model.book;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'book.g.dart';

@GenSerializer(
  ignore: const ['viewSerializer'],
)
class BookViewSerializer extends Serializer<Book> with _$BookViewSerializer {
}

class Book {
  String id;

  String name;

  int publishedYear;

  static BookViewSerializer viewSerializer = new BookViewSerializer();
}
