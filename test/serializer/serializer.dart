/**
 * Created by lejard_h on 14/02/2017.
 */

import 'package:test/test.dart';
import 'package:jaguar_serializer/serializer.dart';

import 'common/models/bibliotek/book.dart';

void main() {
  Book book;
  Serializer serializer;

  setUpAll(() {
    book = new Book();

    book.name = 'Dawn of AI: The last few centuries of humanity';
    book.tags = <String>['AI', 'Humanity', 'SciFi'];
    book.publishedDates = <num, String>{
      1.0: '2010',
      2.0: '2016',
    };
    book.authors = <Author>[
      new Author()..name = 'Teja Hackborn',
      new Author()..name = 'Kleak',
    ];
    serializer = new SerializerJson();
    serializer.add(new BookSerializer());
  });

  group("toObject", () {
    test('Book toObject', () {
      Map object = serializer.toMap(book);
      expect(object is Map, isTrue);
      expect(object["name"], equals(book.name));
      expect(object["tags"], equals(book.tags));
      expect(object["publishedDates"], equals({
        '1.0': '2010',
        '2.0': '2016',
      }));
      expect(object["authors"].length, equals(2));
      expect(object["authors"][0]["name"], equals('Teja Hackborn'));
      expect(object["authors"][1]["name"], equals('Kleak'));
    });

    test('Book toMap', () {
      Map object = serializer.toMap(book);
      expect(object is Map, isTrue);
      expect(object["name"], equals(book.name));
      expect(object["tags"], equals(book.tags));
      expect(object["publishedDates"], equals({
        '1.0': '2010',
        '2.0': '2016',
      }));
      expect(object["authors"].length, equals(2));
      expect(object["authors"][0]["name"], equals('Teja Hackborn'));
      expect(object["authors"][1]["name"], equals('Kleak'));
    });

    test('Book toObject == toMap', () {
      Map map = serializer.toMap(book);
      Map object = serializer.toMap(book);
      expect(map, equals(object));
    });

    test('List<Author> toObject', () {
      serializer.add(new AuthorSerializer());
      var object = serializer.toObject(book.authors);
      expect(object is List, isTrue);
      List list = object;
      expect(list.length, equals(2));
      expect(list[0]["name"], equals('Teja Hackborn'));
      expect(list[1]["name"], equals('Kleak'));
    });

    test('List<Author> toList', () {
      serializer.add(new AuthorSerializer());
      List object = serializer.toList(book.authors);
      expect(object is List, isTrue);
      expect(object.length, equals(2));
      expect(object[0]["name"], equals('Teja Hackborn'));
      expect(object[1]["name"], equals('Kleak'));
    });

    test('List<Author> toList use global MapperSerializer', () {
      SerializerRepo.add(new AuthorSerializer());
      List object = serializer.toList(book.authors);
      expect(object is List, isTrue);
      expect(object.length, equals(2));
      expect(object[0]["name"], equals('Teja Hackborn'));
      expect(object[1]["name"], equals('Kleak'));
    });

    test('List<Author> toObject == toList', () {
      serializer.add(new AuthorSerializer());
      List list = serializer.toList(book.authors);
      var object = serializer.toObject(book.authors);
      expect(list, equals(object));
    });
  });

  group('fromObject', () {
    test('Book', () {
      Book bookTest = serializer.fromObject({
        "name": "Dawn of AI: The last few centuries of humanity",
        "tags": ["AI", "Humanity", "SciFi"],
        "publishedDates": {'1.0': "2010", '2.0': "2016"},
        "authors": [
          {"name": "Teja Hackborn"},
          {"name": "Kleak"}
        ]
      }, type: Book);

      expect(bookTest.name,
          equals("Dawn of AI: The last few centuries of humanity"));
      expect(bookTest.tags, equals(["AI", "Humanity", "SciFi"]));
      expect(bookTest.publishedDates, equals({1.0: "2010", 2.0: "2016"}));
      expect(bookTest.authors.length, equals(2));
      expect(bookTest.authors[0].name, equals("Teja Hackborn"));
      expect(bookTest.authors[1].name, equals("Kleak"));
    });

    test('List<Author>', () {
      serializer.add(new AuthorSerializer());
      List<Author> authors = serializer.fromObject([
        {"name": "Teja Hackborn"},
        {"name": "Kleak"}
      ], type: Author);
      expect(authors.length, equals(2));
      expect(authors[0].name, equals("Teja Hackborn"));
      expect(authors[1].name, equals("Kleak"));
    });

    test('List<Author> use global MapperSerializer', () {
      SerializerRepo.add(new AuthorSerializer());
      List<Author> authors = serializer.fromObject([
        {"name": "Teja Hackborn"},
        {"name": "Kleak"}
      ], type: Author);
      expect(authors.length, equals(2));
      expect(authors[0].name, equals("Teja Hackborn"));
      expect(authors[1].name, equals("Kleak"));
    });

    test('Map<dynamic, String>', () {
      Map<dynamic, String> decode =
          serializer.fromObject({1: "first", "2": "second", 3.0: "third"});
      expect(decode[1], equals("first"));
      expect(decode["2"], equals("second"));
      expect(decode[3.0], equals("third"));
    }, skip: true);

    test('Map<dynamic, Author>', () {
      serializer.add(new AuthorSerializer());
      Map<dynamic, Author> decode = serializer.fromObject({
        "1": {"name": "Teja Hackborn"},
        3.0: {"name": "Kleak"}
      }, type: Author);
      expect(decode["1"].name, equals("Teja Hackborn"));
      expect(decode[3.0].name, equals("Kleak"));
    }, skip: true);

    test('Map<dynamic, dynamic>', () {
      serializer.add(new AuthorSerializer());
      Map<dynamic, dynamic> decode = serializer.fromObject({
        1: {"name": "Teja Hackborn"},
        "2": "second",
        3.0: {"name": "Kleak"}
      });
      expect(decode[1], equals("first"));
      expect(decode["2"], equals("second"));
      expect(decode[3.0], equals("third"));
    }, skip: true);
  });

  group("object with type info", () {
    test('Book', () {
      book.publishedDates = null;
      Map encoded = serializer.toObject(book, withTypeInfo: true);
      Book bookTest = serializer.fromObject(encoded);
      expect(bookTest.name, equals(book.name));
      expect(bookTest.tags, equals(book.tags));
      expect(bookTest.publishedDates, equals(book.publishedDates));
      expect(bookTest.authors.length, equals(book.authors.length));
      expect(bookTest.authors[0].name, equals(book.authors[0].name));
      expect(bookTest.authors[1].name, equals(book.authors[1].name));
    });

    test('List<Author>', () {
      serializer.add(new AuthorSerializer());
      List encoded = serializer.toObject(book.authors, withTypeInfo: true);
      List<Author> authors = serializer.fromObject(encoded);
      expect(authors.length, equals(book.authors.length));
      expect(authors[0].name, equals(book.authors[0].name));
      expect(authors[1].name, equals(book.authors[1].name));
    });
  });

  test('global config', () {
    SerializerRepo.typeInfoKey = "#my_type_info_key";
    Map object = serializer.toMap(book, withTypeInfo: true);
    expect(object[SerializerRepo.typeInfoKey],
        equals(serializer.getByType(Book).modelString));
  });
}
