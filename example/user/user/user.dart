library example.model.user;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:intl/intl.dart';
import '../book/book.dart';

part 'user.g.dart';

class DateTimeSerializer implements FieldProcessor<DateTime, String> {
  final String pattern;

  final String locale;

  const DateTimeSerializer({this.pattern: 'yyyy-MM-dd HH:mm:ss', this.locale});

  /// Called to process field before decoding
  DateTime deserialize(String value) {
    return new DateFormat(pattern, locale).parse(value);
  }

  /// Called to process field before encoding
  String serialize(DateTime value) {
    return new DateFormat(pattern, locale).format(value);
  }
}

@GenSerializer(fields: const {
  'id': const EnDecode('Id'),
  'name': const EnDecode('N'),
  'email': const EnDecode('Email'),
  'book': const EnDecode('Book'),
  'dob': const EnDecode('DoB'),
  'password': const Ignore(),
}, ignore: const [
  'passwordHash',
  'viewSerializer'
], processors: const {
  'dob': const DateTimeSerializer(),
}, serializers: const [
  BookViewSerializer,
])
class UserViewSerializer extends Serializer<User> with _$UserViewSerializer {
  User createModel() => new User();
}

class User {
  String id;

  String email;

  String name;

  DateTime dob;

  String get passwordHash => _passwordHash;

  String _passwordHash;

  Book book;

  List<String> listStr = new List<String>();

  List<Book> listBook = new List<Book>();

  Map<String, String> map;

  Map<String, Map<String, String>> mapMap;

  Map<String, Book> mapBook;

  /* TODO

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

  static UserViewSerializer viewSerializer = new UserViewSerializer();
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
