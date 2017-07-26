library serializer.test.models.book;

import 'package:jaguar_serializer/serializer.dart';
import 'author.dart';

export 'author.dart' show Author, AuthorSerializer;

part 'book.g.dart';

@GenSerializer(serializers: const [
  AuthorSerializer,
], processors: const {
  'publishedDates': const MapKeyNumToStringProcessor()
})
class BookSerializer extends Serializer<Book> with _$BookSerializer {
  Book createModel() => new Book();
}

class MapKeyNumToStringProcessor
    implements FieldProcessor<Map<num, String>, Map<dynamic, String>> {
  const MapKeyNumToStringProcessor();

  Map<num, String> deserialize(final Map<dynamic, String> input) {
    if (input == null) {
      return null;
    }
    Map<num, String> fromMap = {};
    for (var key in input.keys) {
      if (key is String) {
        fromMap[num.parse(key)] = input[key];
      } else if (key is num) {
        fromMap[key] = input[key];
      }
    }
    return fromMap;
  }

  Map<String, String> serialize(final Map<num, String> value) {
    if (value == null) {
      return null;
    }
    Map<String, String> toMap = {};
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
