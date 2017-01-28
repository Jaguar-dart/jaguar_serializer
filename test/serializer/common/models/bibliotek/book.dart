library serializer.test.models.book;

import 'package:jaguar_serializer/serializer.dart';
import 'author.dart';

export 'author.dart' show Author, AuthorSerializer;

part 'book.g.dart';

@GenSerializer()
class BookSerializer extends MapSerializer<Book> with _$BookSerializer  {
  Book createModel() => new Book();

  BookSerializer() {
    JaguarSerializer.addSerializer(new AuthorSerializer());
  }
}

/// Player model for the game
class Book {
  /// Name of the player
  String name;

  List<String> tags;

  Map<num, String> publishedDates;

  List<Author> authors;
}
