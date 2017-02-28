library serializer.test.models.book;

import 'package:jaguar_serializer/serializer.dart';
import 'author.dart';

export 'author.dart' show Author, AuthorSerializer;

part 'book.g.dart';

@GenSerializer()
@ProvideSerializer(Author, AuthorSerializer)
@MapKeyNumToStringProcessor(#publishedDates)
class BookSerializer extends Serializer<Book> with _$BookSerializer {
  Book createModel() => new Book();
}

@DefineFieldProcessor()
class MapKeyNumToStringProcessor
    implements FieldProcessor<Map<num, dynamic>, Map<dynamic, dynamic>> {
  final Symbol field;

  const MapKeyNumToStringProcessor(this.field);

  Map<num, dynamic> from(final Map<dynamic, dynamic> input) {
    if (input == null) {
      return null;
    }
    Map<num, dynamic> fromMap = {};
    for (var key in input.keys) {
      if (key is String) {
        fromMap[num.parse(key)] = input[key];
      } else if (key is num) {
        fromMap[key] = input[key];
      }
    }
    return fromMap;
  }

  Map<dynamic, dynamic> to(final Map<num, dynamic> value) {
    if (value == null) {
      return null;
    }
    Map<String, dynamic> toMap = {};
    for (num key in value.keys) {
      toMap[key.toString()] = value[key];
    }
    return toMap;
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
