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
      new Author()
        ..name = 'Teja Hackborn',
      new Author()
        ..name = 'Kleak',
    ];
    serializer = new SerializerJson();
    serializer.addSerializer(new BookSerializer());
  });

  group('toJson', () {
    test('Book', () {
      String encode = serializer.encode(book);
      expect(
          encode,
          equals('{'
              '"name":"Dawn of AI: The last few centuries of humanity",'
              '"tags":["AI","Humanity","SciFi"],'
              '"publishedDates":{"1.0":"2010","2.0":"2016"},'
              '"authors":[{"name":"Teja Hackborn"},{"name":"Kleak"}]}'));
    });

    test('List<Author>', () {
      serializer.addSerializer(new AuthorSerializer());
      String encode = serializer.encode(book.authors);
      expect(encode, equals('[{"name":"Teja Hackborn"},{"name":"Kleak"}]'));
    });

    test('Iterable<Author>', () {
      serializer.addSerializer(new AuthorSerializer());
      Map tester = {
        1: new Author()
          ..name = 'Teja Hackborn',
        2: new Author()
          ..name = 'Kleak',
      };
      String encode = serializer.encode(tester.values);
      expect(encode, equals('[{"name":"Teja Hackborn"},{"name":"Kleak"}]'));
    });

    test('Map<dynamic, String>', () {
      Map<dynamic, String> map = {1: "first", "2": "second", 3.0: "third"};
      String encode = serializer.encode(map);
      expect(encode, equals('{"1":"first","2":"second","3.0":"third"}'));
    });

    test('Map<dynamic, dynamic>', () {
      serializer.addSerializer(new AuthorSerializer());
      Map<dynamic, dynamic> map = {
        1: book.authors.first,
        "2": "second",
        3.0: book.authors.last
      };
      String encode = serializer.encode(map);
      expect(
          encode,
          equals(
              '{"1":{"name":"Teja Hackborn"},"2":"second","3.0":{"name":"Kleak"}}'));
    });

    test('const Map<dynamic, dynamic>', () {
      serializer.addSerializer(new AuthorSerializer());
      const Map<dynamic, dynamic> map = const {1: 1.1, "2": "second", 3: 3};
      String encode = serializer.encode(map);
      expect(encode, equals('{"1":1.1,"2":"second","3":3}'));
    });
  });

  group('fromJson', () {
    test('Book', () {
      //todo: decode to Map<num, dynamic>
      Book bookTest = serializer.decode('{'
          '"name":"Dawn of AI: The last few centuries of humanity",'
          '"tags":["AI","Humanity","SciFi"],'
          '"authors":[{"name":"Teja Hackborn"},{"name":"Kleak"}]}', type: Book);

      expect(bookTest.name, equals("Dawn of AI: The last few centuries of humanity"));
      expect(bookTest.tags, equals(["AI", "Humanity", "SciFi"]));
      //expect(bookTest.publishedDates, equals({"1.0": "2010", "2.0": "2016"}));
      expect(bookTest.authors.length, equals(2));
      expect(bookTest.authors[0].name, equals("Teja Hackborn"));
      expect(bookTest.authors[1].name, equals("Kleak"));
    });

    test('List<Author>', () {
      serializer.addSerializer(new AuthorSerializer());
      List<Author> authors = serializer.decode('[{"name":"Teja Hackborn"},{"name":"Kleak"}]', type: Author);
      expect(authors.length, equals(2));
      expect(authors[0].name, equals("Teja Hackborn"));
      expect(authors[1].name, equals("Kleak"));
    });

    //todo: decode to Map<dynamic, String>
    test('Map<dynamic, String>', () {
      var decode = serializer.decode('{"1":"first","2":"second","3.0":"third"}');
    }, skip: true);

    //todo: decode to Map<dynamic, dynamic>
    test('Map<dynamic, dynamic>', () {
      serializer.addSerializer(new AuthorSerializer());
      var decode = serializer.decode('{"1":{"name":"Teja Hackborn"},"2":"second","3.0":{"name":"Kleak"}}');
    }, skip: true);

    //todo: decode to Map<dynamic, dynamic>
    test('const Map<dynamic, dynamic>', () {
      serializer.addSerializer(new AuthorSerializer());
      var decode  = serializer.decode('{"1":1.1,"2":"second","3":3}');
    }, skip: true);
  });

  group("json with type info", () {
    test('Book', () {
      book.publishedDates = null;
      String encoded = serializer.encode(book, withTypeInfo: true);
      Book bookTest = serializer.decode(encoded);
      expect(bookTest.name, equals(book.name));
      expect(bookTest.tags, equals(book.tags));
      expect(bookTest.publishedDates, equals(book.publishedDates));
      expect(bookTest.authors.length, equals(book.authors.length));
      expect(bookTest.authors[0].name, equals(book.authors[0].name));
      expect(bookTest.authors[1].name, equals(book.authors[1].name));
    });

    test('List<Author>', () {
      serializer.addSerializer(new AuthorSerializer());
      String encoded = serializer.encode(book.authors, withTypeInfo: true);
      List<Author> authors = serializer.decode(encoded);
      expect(authors.length, equals(book.authors.length));
      expect(authors[0].name, equals(book.authors[0].name));
      expect(authors[1].name, equals(book.authors[1].name));
    });
  });
}
