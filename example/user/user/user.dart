library example.model.user;

import 'package:jaguar_serializer/src/map_serializer/import.dart';
import 'package:jaguar_serializer/src/view_serializer/import.dart';
import '../book/book.dart';

part 'user.g.dart';

@GenSerializer()
@EnDecodeField(#name, fromAndAs: 'N')
@ProvideSerializers(const {
  Book: BookViewSerializer,
})
class UserViewSerializer extends Object
    with _$UserViewSerializer, JsonMixin
    implements MapSerializer<User> {
  final User _model;

  UserViewSerializer(this._model);

  UserViewSerializer.FromMap(Map map) : _model = new User() {
    fromMap(map);
  }

  User get model => _model;
}

class User extends Object
    implements SerializableToView {
  String id;

  String email;

  String name;

  String get passwordHash => _passwordHash;

  String _passwordHash;

  Book book;

  List<Book> books = new List<Book>();

  set password(String value) {
    _passwordHash = value;
  }

  UserViewSerializer get viewSerializer => new UserViewSerializer(this);
}

/*
abstract class _$UserViewSerializer {
  User get _model;

  Map toMap() => {
        "id": _model.id,
        "email": _model.email,
        "N": _model.name,
        'book': new BookViewSerializer(_model.book).toMap(),
        'books': _model.books
            ?.map((Book element) => new BookViewSerializer(element).toMap())
            ?.toList() as List<Map>,
      };

  void fromMap(Map map) {
    if(map is! Map) {
      return;
    }

    _model.id = map["id"];
    _model.email = map['email'];
    _model.name = map['N'];
    _model.book = new BookViewSerializer.FromMap(map['book']).model;

    if (map['books'] is List<Map>) {
      List<Map> value = map['books'];
      List<Book> parsed = <Book>[];
      for (Map element in value) {
        parsed.add(new BookViewSerializer.FromMap(element).model);
      }
      _model.books = parsed;
    }
  }
}
 */