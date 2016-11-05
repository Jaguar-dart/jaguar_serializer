library serializer.test.list_map;

import 'package:test/test.dart';

import 'package:jaguar_serializer/generator/parser/import.dart';
import 'package:jaguar_serializer/generator/writer/writer.dart';

const PropertyTo prop1 = const ListPropertyTo(
    const ListPropertyTo(const BuiltinLeafPropertyTo(), 'String'),
    'List<String>');

void main() {
  group('Builtin', () {
    setUp(() {});

    test('prop1', () {
      ToItemWriter item = new ToItemWriter(prop1);
      String str = item.generate('model.tags');
      print(str);
    });
  });
}
