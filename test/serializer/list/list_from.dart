library serializer.test.list_map.from;

import 'package:test/test.dart';

import '../common/models/bibliotek/book.dart';

void main() {
  group('From.List.Map', () {
    Map map;

    setUp(() {
      map = {
        'name': 'Dawn of AI: The last few centuries of humanity',
        'tags': ['AI', 'Humanity', 'SciFi'],
        'publishedDates': {
          1.0: '2010',
          2.0: '2016',
        },
        'authors': [
          {'name': 'Teja Hackborn'},
          {'name': 'Kleak'},
        ],
      };
    });

    test('To', () {
      BookSerializer serializer = new BookSerializer();
      Book book = serializer.fromMap(map);

      expect(book.name, 'Dawn of AI: The last few centuries of humanity');
      expect(book.tags, <String>['AI', 'Humanity', 'SciFi']);
      expect(book.publishedDates, {
        1.0: '2010',
        2.0: '2016',
      });
      expect(book.authors, <Author>[
        new Author()..name = 'Teja Hackborn',
        new Author()..name = 'Kleak',
      ]);
    });

    test('null list field', () {
      map['tags'] = null;

      BookSerializer serializer = new BookSerializer();
      Book book = serializer.fromMap(map);

      expect(book.name, 'Dawn of AI: The last few centuries of humanity');
      expect(book.tags, isNull);
      expect(book.publishedDates, {
        1.0: '2010',
        2.0: '2016',
      });
      expect(book.authors, <Author>[
        new Author()..name = 'Teja Hackborn',
        new Author()..name = 'Kleak',
      ]);
    });

    test('null item in list', () {
      (map['authors'] as List).add(null);

      BookSerializer serializer = new BookSerializer();
      Book book = serializer.fromMap(map);

      expect(book.name, 'Dawn of AI: The last few centuries of humanity');
      expect(book.tags, <String>['AI', 'Humanity', 'SciFi']);
      expect(book.publishedDates, {
        1.0: '2010',
        2.0: '2016',
      });
      expect(book.authors, <Author>[
        new Author()..name = 'Teja Hackborn',
        new Author()..name = 'Kleak',
        null
      ]);
    });
  });
}
