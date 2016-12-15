library serializer.test.nested_object.to;

import 'package:test/test.dart';

import '../common/models/address_book/address_book.dart';

void main() {
  group('Nested object', () {
    test('Null nested object', () {
      Person person = new Person();
      person.name = 'Superman';

      Map result = person.toMap(person);
      expect(result, containsPair('name', 'Superman'));
      expect(result, isNot(contains('address')));
    });
  });
}
