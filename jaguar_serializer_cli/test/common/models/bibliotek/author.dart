library serializer.test.models.Author;

import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'author.g.dart';

@GenSerializer(serializers: const [])
class AuthorSerializer extends Serializer<Author> with _$AuthorSerializer {}

/// Author model
class Author {
  /// Name of the author
  String name;

  bool operator ==(Object other) {
    if (other is Author) {
      return name == other.name;
    }

    return false;
  }
}
