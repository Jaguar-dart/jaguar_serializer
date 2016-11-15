library serializer.test.models.book;

import 'package:jaguar_serializer/serializer.dart';
import 'author.dart';

export 'author.dart' show Author, AuthorSerializer;

part 'book.g.dart';

@GenSerializer()
@ProvideSerializers(const {
  Author: AuthorSerializer,
})
class BookSerializer extends Object
    with JsonMixin, _$BookSerializer
    implements MapSerializer<Book> {
  Book createModel() => new Book();

  BookSerializer();
}

/// Player model for the game
class Book {
  /// Name of the player
  String name;

  List<String> tags;

  Map<num, String> publishedDates;

  List<Author> authors;
}
