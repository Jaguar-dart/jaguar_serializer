import 'common/models/bibliotek/bibliotek.dart';
import 'package:test/test.dart';

void main() {
  group("List", () {
    group("encode", () {
      Book book;

      setUp(() {
        book = new Book();

        book.tags = <String>['AI', 'Humanity', 'SciFi'];
        book.authors = <Author>[
          new Author()..name = 'Teja Hackborn',
          new Author()..name = 'Kleak',
        ];
      });

      test('should encode list of object', () {
        BookSerializer serializer = new BookSerializer();
        Map map = serializer.toMap(book);

        expect(
            map,
            containsPair('authors', [
              {'name': 'Teja Hackborn'},
              {'name': 'Kleak'}
            ]));
      });

      test('should not encode null list', () {
        book.tags = null;

        BookSerializer serializer = new BookSerializer();
        Map map = serializer.toMap(book);
        expect(map['tags'], isNull);
      });

      test('should handle null item in list', () {
        book.authors.add(null);

        BookSerializer serializer = new BookSerializer();
        Map map = serializer.toMap(book);

        expect(
            map,
            containsPair('authors', [
              {'name': 'Teja Hackborn'},
              {'name': 'Kleak'},
              null,
            ]));
      });

      test('should handle list of processors field', () {
        book.websites = [Uri.parse("http://localhost/hello/book/test"), null];

        BookSerializer serializer = new BookSerializer();
        Map map = serializer.toMap(book);

        expect(
            map,
            containsPair(
                'websites', ["http://localhost/hello/book/test", null]));
      });
    });

    group("decode", () {
      Map<String, dynamic> map;

      setUp(() {
        map = <String, dynamic>{
          'tags': ['AI', 'Humanity', 'SciFi'],
          'authors': [
            {'name': 'Teja Hackborn'},
            {'name': 'Kleak'},
          ],
        };
      });

      test('should handle list of objects', () {
        BookSerializer serializer = new BookSerializer();
        Book book = serializer.fromMap(map);

        expect(book.tags, <String>['AI', 'Humanity', 'SciFi']);
        expect(book.authors, <Author>[
          new Author()..name = 'Teja Hackborn',
          new Author()..name = 'Kleak',
        ]);
      });

      test('should handle null list', () {
        map['tags'] = null;

        BookSerializer serializer = new BookSerializer();
        Book book = serializer.fromMap(map);

        expect(book.tags, isNull);
        expect(book.authors, <Author>[
          new Author()..name = 'Teja Hackborn',
          new Author()..name = 'Kleak',
        ]);
      });

      test('should handle null object in list', () {
        (map['authors'] as List).add(null);

        BookSerializer serializer = new BookSerializer();
        Book book = serializer.fromMap(map);

        expect(book.tags, <String>['AI', 'Humanity', 'SciFi']);
        expect(book.authors, <Author>[
          new Author()..name = 'Teja Hackborn',
          new Author()..name = 'Kleak',
          null
        ]);
      });

      test('should handle empty object in list', () {
        (map['authors'] as List).add(<String, dynamic>{});

        BookSerializer serializer = new BookSerializer();
        Book book = serializer.fromMap(map);

        expect(book.tags, <String>['AI', 'Humanity', 'SciFi']);
        expect(book.authors, <Author>[
          new Author()..name = 'Teja Hackborn',
          new Author()..name = 'Kleak',
          new Author()
        ]);
      });

      test('should handle list of processors field', () {
        map['websites'] = ["http://localhost/hello/book/test", null];

        BookSerializer serializer = new BookSerializer();
        Book book = serializer.fromMap(map);

        expect(book.websites,
            <Uri>[Uri.parse("http://localhost/hello/book/test"), null]);
      });
    });
  });
}
