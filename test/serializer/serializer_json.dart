/**
 * Created by lejard_h on 14/02/2017.
 */

import 'package:test/test.dart';
import 'package:jaguar_serializer/serializer.dart';

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
    serializer = new JsonRepo();
    serializer.add(new BookSerializer());
  });

  group('toJson', () {
    test('Book', () {
      String encode = serializer.serialize(book);
      expect(
          encode,
          equals('{'
              '"name":"Dawn of AI: The last few centuries of humanity",'
              '"tags":["AI","Humanity","SciFi"],'
              '"publishedDates":{"1":"2010","2":"2016"},'
              '"authors":[{"name":"Teja Hackborn"},{"name":"Kleak"}]}'));
    });

    test('List<Author>', () {
      serializer.add(new AuthorSerializer());
      String encode = serializer.serialize(book.authors);
      expect(encode, equals('[{"name":"Teja Hackborn"},{"name":"Kleak"}]'));
    });

    test('Iterable<Author>', () {
      serializer.add(new AuthorSerializer());
      Map tester = {
        1: new Author()..name = 'Teja Hackborn',
        2: new Author()..name = 'Kleak',
      };
      String encode = serializer.serialize(tester.values);
      expect(encode, equals('[{"name":"Teja Hackborn"},{"name":"Kleak"}]'));
    });
  });

  group('fromJson', () {
    test('Book', () {
      //todo: decode to Map<num, dynamic>
      Book bookTest = serializer.deserialize(
          '{'
          '"name":"Dawn of AI: The last few centuries of humanity",'
          '"tags":["AI","Humanity","SciFi"],'
          '"authors":[{"name":"Teja Hackborn"},{"name":"Kleak"}]}',
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
          '[{"name":"Teja Hackborn"},{"name":"Kleak"}]',
          type: Author);
      expect(authors.length, equals(2));
      expect(authors[0].name, equals("Teja Hackborn"));
      expect(authors[1].name, equals("Kleak"));
    });
  });

  group("json with type info", () {
    test('Book', () {
      book.publishedDates = null;
      String encoded = serializer.serialize(book, withType: true);
      Book bookTest = serializer.deserialize(encoded);
      expect(bookTest.name, equals(book.name));
      expect(bookTest.tags, equals(book.tags));
      expect(bookTest.publishedDates, equals(book.publishedDates));
      expect(bookTest.authors.length, equals(book.authors.length));
      expect(bookTest.authors[0].name, equals(book.authors[0].name));
      expect(bookTest.authors[1].name, equals(book.authors[1].name));
    });

    test('List<Author>', () {
      serializer.add(new AuthorSerializer());
      String encoded = serializer.serialize(book.authors, withType: true);
      List<Author> authors = serializer.deserialize(encoded);
      expect(authors.length, equals(book.authors.length));
      expect(authors[0].name, equals(book.authors[0].name));
      expect(authors[1].name, equals(book.authors[1].name));
    });
  });
}
