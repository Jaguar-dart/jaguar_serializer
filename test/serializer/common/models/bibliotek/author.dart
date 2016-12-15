library serializer.test.models.Author;

import 'package:jaguar_serializer/serializer.dart';

part 'author.g.dart';

@GenSerializer()
class AuthorSerializer extends Object
    with JsonMixin, _$AuthorSerializer
    implements MapSerializer<Author> {
  Author createModel() => new Author();

  AuthorSerializer();
}

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
