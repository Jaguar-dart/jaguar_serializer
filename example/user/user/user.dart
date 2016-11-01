library example.model.user;

import 'package:serialize/src/map_serializer/import.dart';
import 'package:serialize/src/view_serializer/import.dart';
import '../book/book.dart';

part 'user.g.dart';

@MakeSerializer()
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
