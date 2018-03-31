import 'common/models/bibliotek/bibliotek.dart';
import 'package:test/test.dart';

import 'common/models/nested/nested.dart';

void main() {
  group("Map", () {
    final serializerBook = new BookSerializer();
    final serializerOuterModel = new OuterModelSerializer();
    final now = new DateTime.now();

    group("encode", () {
      Book book;
      OuterModel model;

      setUp(() {
        model = new OuterModel();
        book = new Book();

        book.publishedDates = {"1": now};

        model.map = {"1": new InnerModel2()..name = "foo"};
      });

      test('should encode map of object', () {
        Map map = serializerOuterModel.toMap(model);

        expect(
            map,
            containsPair('map', {
              "1": {"name": "foo"}
            }));
      });

      test('should encode map of processor', () {
        Map map = serializerBook.toMap(book);

        expect(
            map, containsPair('publishedDates', {"1": now.toIso8601String()}));
      });

      test('should not encode null map', () {
        book.publishedDates = null;

        Map map = serializerBook.toMap(book);
        expect(map['publishedDates'], isNull);
      });

      test('should handle null object in map', () {
        book.publishedDates["2"] = null;

        Map map = serializerBook.toMap(book);

        expect(
            map,
            containsPair(
                'publishedDates', {"1": now.toIso8601String(), "2": null}));
      });

      test('should handle null processor in map', () {
        model.map["2"] = null;

        Map map = serializerOuterModel.toMap(model);

        expect(
            map,
            containsPair('map', {
              "1": {"name": "foo"},
              "2": null
            }));
      });
    });

    group("decode", () {
      Map<String, dynamic> bookMap;
      Map<String, dynamic> modelMap;

      setUp(() {
        bookMap = <String, dynamic>{
          'publishedDates': {"1": now.toIso8601String()}
        };

        modelMap = <String, dynamic>{
          "map": {
            "1": {"name": "foo"}
          }
        };
      });

      test('should handle map of objects', () {
        final model = serializerOuterModel.fromMap(modelMap);

        expect(model.map["1"].name, "foo");
      });

      test('should handle null map', () {
        bookMap['publishedDates'] = null;
        Book book = serializerBook.fromMap(bookMap);

        expect(book.publishedDates, isNull);
      });

      test('should handle null object in Map', () {
        modelMap['map']["2"] = null;

        final model = serializerOuterModel.fromMap(modelMap);

        expect(model.map["1"].name, "foo");
        expect(model.map["2"], isNull);
      });

      test('should handle null processor in Map', () {
        bookMap['publishedDates']["2"] = null;

        Book book = serializerBook.fromMap(bookMap);

        expect(book.publishedDates, {"1": now, "2": null});
      });

      test('should handle empty object in map', () {
        modelMap['map']["2"] = <String, dynamic>{};
        final model = serializerOuterModel.fromMap(modelMap);

        expect(model.map["1"].name, "foo");
        expect(model.map["2"], isNotNull);
      });
    });
  });
}
