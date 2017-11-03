/**
 * Created by lejard_h on 14/02/2017.
 */

import 'package:test/test.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'common/models/bibliotek/book.dart';

void main() {
  Book book;
  SerializerRepo serializer;

  setUpAll(() {
    book = new Book();

    book.name = 'Dawn of AI: The last few centuries of humanity';
    book.tags = <String>['AI', 'Humanity', 'SciFi'];
    book.publishedDates = <num, String>{
      1: '2010',
      2: '2016',
    };
    book.authors = <Author>[
      new Author()..name = 'Teja Hackborn',
      new Author()..name = 'Kleak',
    ];
    serializer = new YamlRepo(withType: true);
    serializer.add(new BookSerializer());
  });

  group('toYaml', () {
    test('Book', () {
      String encode = serializer.serialize(book, withType: false);
      expect(
          encode,
          equals('name: "Dawn of AI: The last few centuries of humanity"\n'
              'publishedDates: \n'
              '  1: "2010"\n'
              '  2: "2016"\n'
              'authors: \n'
              '  - \n'
              '    name: "Teja Hackborn"\n'
              '  - \n'
              '    name: "Kleak"\n'
              'tags: \n'
              '  - "AI"\n'
              '  - "Humanity"\n'
              '  - "SciFi"\n'));
    });

    test('List<Author>', () {
      serializer.add(new AuthorSerializer());
      String encode = serializer.serialize(book.authors, withType: false);
      expect(
          encode,
          equals('- \n'
              '  name: "Teja Hackborn"\n'
              '- \n'
              '  name: "Kleak"\n'));
    });

    test('Iterable<Author>', () {
      serializer.add(new AuthorSerializer());
      Map tester = {
        1: new Author()..name = 'Teja Hackborn',
        2: new Author()..name = 'Kleak',
      };
      String encode = serializer.serialize(tester.values, withType: false);
      expect(
          encode,
          equals('- \n'
              '  name: "Teja Hackborn"\n'
              '- \n'
              '  name: "Kleak"\n'));
    });

    test('Map<dynamic, dynamic>', () {
      serializer.add(new AuthorSerializer());
      Map<dynamic, dynamic> map = {
        1: book.authors.first,
        "2": "second",
        3: book.authors.last
      };
      String encode = serializer.serialize(map, withType: false);
      expect(
          encode,
          equals('2: "second"\n'
              '1: \n'
              '  name: "Teja Hackborn"\n'
              '3: \n'
              '  name: "Kleak"\n'));
    });
  });

  group('fromYaml', () {
    test('Book', () {
      //todo: decode to Map<num, dynamic>
      Book bookTest = serializer.deserialize(
          'name: "Dawn of AI: The last few centuries of humanity"\n'
          'publishedDates: \n'
          '  1: "2010"\n'
          '  2: "2016"\n'
          'authors: \n'
          '  - \n'
          '    name: "Teja Hackborn"\n'
          '  - \n'
          '    name: "Kleak"\n'
          'tags: \n'
          '  - "AI"\n'
          '  - "Humanity"\n'
          '  - "SciFi"\n',
          type: Book);

      expect(bookTest.name,
          equals("Dawn of AI: The last few centuries of humanity"));
      expect(bookTest.tags, equals(["AI", "Humanity", "SciFi"]));
      //expect(bookTest.publishedDates, equals({"1.0": "2010", "2.0": "2016"}));
      expect(bookTest.authors.length, equals(2));
      expect(bookTest.authors[0].name, equals("Teja Hackborn"));
      expect(bookTest.authors[1].name, equals("Kleak"));
    });

    test('List<Author>', () {
      serializer.add(new AuthorSerializer());
      List<Author> authors = serializer.deserialize(
          '- \n'
          '  name: "Teja Hackborn"\n'
          '- \n'
          '  name: "Kleak"\n',
          type: Author);
      expect(authors.length, equals(2));
      expect(authors[0].name, equals("Teja Hackborn"));
      expect(authors[1].name, equals("Kleak"));
    });
  });

  group("yaml with type info", () {
    test('Book', () {
      book.publishedDates = null;
      String encoded = serializer.serialize(book, typeKey: "(t)");
      Book bookTest = serializer.deserialize(encoded, typeKey: "(t)");
      expect(bookTest.name, equals(book.name));
      expect(bookTest.tags, equals(book.tags));
      expect(bookTest.publishedDates, equals(book.publishedDates));
      expect(bookTest.authors.length, equals(book.authors.length));
      expect(bookTest.authors[0].name, equals(book.authors[0].name));
      expect(bookTest.authors[1].name, equals(book.authors[1].name));
    });

    test('List<Author>', () {
      serializer.add(new AuthorSerializer());
      String encoded = serializer.serialize(book.authors, typeKey: "(t)");
      List<Author> authors = serializer.deserialize(encoded, typeKey: "(t)");
      expect(authors.length, equals(book.authors.length));
      expect(authors[0].name, equals(book.authors[0].name));
      expect(authors[1].name, equals(book.authors[1].name));
    });
  });
}
