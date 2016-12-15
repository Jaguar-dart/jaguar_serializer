library serializer.test.list_map.to;

import 'package:test/test.dart';

import '../common/models/bibliotek/book.dart';

void main() {
  group('To.List.Map', () {
    Book book;

    setUp(() {
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
    });

    test('From', () {
      BookSerializer serializer = new BookSerializer();
      Map map = serializer.toMap(book);

      expect(
          map,
          containsPair(
              'name', 'Dawn of AI: The last few centuries of humanity'));
      expect(map, containsPair('tags', <String>['AI', 'Humanity', 'SciFi']));
      expect(
          map,
          containsPair('publishedDates', {
            1.0: '2010',
            2.0: '2016',
          }));
      expect(
          map,
          containsPair('authors', [
            {'name': 'Teja Hackborn'},
            {'name': 'Kleak'}
          ]));
    });

    test('null list field', () {
      book.tags = null;

      BookSerializer serializer = new BookSerializer();
      Map map = serializer.toMap(book);

      expect(
          map,
          containsPair(
              'name', 'Dawn of AI: The last few centuries of humanity'));
      expect(map['tags'], isNull);
      expect(
          map,
          containsPair('publishedDates', {
            1.0: '2010',
            2.0: '2016',
          }));
      expect(
          map,
          containsPair('authors', [
            {'name': 'Teja Hackborn'},
            {'name': 'Kleak'}
          ]));
    });

    test('null item in list', () {
      book.authors.add(null);

      BookSerializer serializer = new BookSerializer();
      Map map = serializer.toMap(book);

      expect(
          map,
          containsPair(
              'name', 'Dawn of AI: The last few centuries of humanity'));
      expect(map, containsPair('tags', <String>['AI', 'Humanity', 'SciFi']));
      expect(
          map,
          containsPair('publishedDates', {
            1.0: '2010',
            2.0: '2016',
          }));
      expect(
          map,
          containsPair('authors', [
            {'name': 'Teja Hackborn'},
            {'name': 'Kleak'},
            null,
          ]));
    });
  });
}
