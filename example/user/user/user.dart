library example.model.user;

import 'package:jaguar_serializer/src/map_serializer/import.dart';
import 'package:jaguar_serializer/src/view_serializer/import.dart';
import 'package:intl/intl.dart';
import '../book/book.dart';

part 'user.g.dart';

@DefineFieldProcessor()
class DateTimeSerializer implements FieldProcessor<DateTime, String> {
  /// Field in the model to be processed
  final Symbol field;

  final String pattern;

  final String locale;

  const DateTimeSerializer(this.field,
      {this.pattern: 'yyyy-MM-dd HH:mm:ss', this.locale});

  /// Called to process field before decoding
  DateTime from(String value) {
    return new DateFormat(pattern, locale).parse(value);
  }

  /// Called to process field before encoding
  String to(DateTime value) {
    return new DateFormat(pattern, locale).format(value);
  }
}

@GenSerializer()
@DateTimeSerializer(#dob)
@EncodeField(#id, as: 'Id')
@DecodeField(#id, from: 'Id')
@EnDecodeField(#name, asAndFrom: 'N')
@EnDecodeFields(const {
  #email: 'Email',
  #book: 'Book',
  #dob: 'DoB',
})
@ProvideSerializers(const <Type, Type>{
  Book: BookViewSerializer,
})
@IgnoreField(#password)
@IgnoreFields(const [#passwordHash, #_passwordHash, #viewSerializer])
class UserViewSerializer extends Object
    with _$UserViewSerializer, JsonMixin
    implements MapSerializer<User> {
  final User _model;

  UserViewSerializer([User model]) : _model = model ?? new User();

  User get model => _model;
}

class User extends Object implements SerializableToView {
  String id;

  String email;

  String name;

  DateTime dob;

  String get passwordHash => _passwordHash;

  String _passwordHash;

  Book book;

  /* TODO

  List<String> list = new List<String>();

  Map<String, String> map;

  Map<String, Map<String, String>> mapOfMap;

  Map<String, Map<String, Book>> mapOfMapOfBooks;

  Map<String, List<String>> mapList;

  List<List<String>> listOfList;

  List<List<Book>> listOfListOfBooks;

  Map<String, Map<String, String>> mapOfMap;

  List<Map<String, List<Map<String, String>>>> mixed1;
  */

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

/*
new Map.fromIterable(model.mapOfMap.keys,
        key: (String key) => key,
        value: (String key) => new Map.fromIterable(model.mapOfMap[key].keys,
            key: (String key) => key,
            value: (String key) => model.mapOfMap[key][key]));

    new MapMaker<String, Map<String, String>, String, Map<String, String>>(
        model.mapOfMap, (String key) => key, (Map<String, String> value) {
      return new MapMaker<String, String, String, String>(
          value, (String key) => key, (String value) => value).model;
    }).model;

    new MapMaker<String, List<String>, String, List<String>>(
        model.mapList, (String key) => key, (List<String> value) {
      return value.map((String string) => string);
    }).model;
 */
