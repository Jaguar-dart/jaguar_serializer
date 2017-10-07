library serializer.test.exclude_by_default;

import 'package:test/test.dart';

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'exclude_by_default.g.dart';

class ExcludeByDefault {
  String id;

  String name;

  String email;

  int _number;

  int get number => _number;

  set number(int value) {
    _number = value;
  }
}

@GenSerializer(includeByDefault: false, fields: const {
  'id': const [const EnDecode('id')],
  'name': const [const EnDecode('name')],
})
class ExcludeByDefaultCodec extends Serializer<ExcludeByDefault>
    with _$ExcludeByDefaultCodec {
  ExcludeByDefault createModel() => new ExcludeByDefault();
}

void main() {
  group('Builtin', () {
    ExcludeByDefaultCodec serializer = new ExcludeByDefaultCodec();

    setUp(() {});

    // Check if fromMap converts all Map items to fields
    test('From map', () {
      Map m = {};
      m['id'] = '1';
      m['name'] = 'teja';
      m['email'] = 'secret';
      m['number'] = 1000;

      ExcludeByDefault model = serializer.fromMap(m);
      expect(model.id, '1');
      expect(model.name, 'teja');
      expect(model.email, null);
      expect(model.number, null);
    });

    // Check if toMap converts all fields to Map items
    test('To map', () {
      ExcludeByDefault model = new ExcludeByDefault();
      model.id = '2';
      model.name = "kleak";
      model.email = "cryptic";
      model._number = 2;

      Map result = serializer.toMap(model);
      expect(result, containsPair('id', '2'));
      expect(result, containsPair('name', 'kleak'));
      expect(result, isNot(contains('email')));
      expect(result, isNot(contains('number')));
    });
  });
}
