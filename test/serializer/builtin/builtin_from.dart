library serializer.test.builtin.from;

import 'package:test/test.dart';

import 'models/player.dart';

void main() {
  group('Builtin', () {
    Map m;

    setUp(() {
      m = {};
      m['name'] = 'John';
      m['email'] = 'john@noemail.com';
      m['age'] = 25;
      m['score'] = 1000;
      m['emailConfirmed'] = true;
    });

    // Check if fromMap converts all Map items to fields
    test('To map', () {
      PlayerJsonSerializer serializer = new PlayerJsonSerializer();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, 'john@noemail.com');
      expect(player.age, 25);
      expect(player.score, 1000);
      expect(player.emailConfirmed, true);
    });

    // When field not present in Map
    test('Field not present', () {
      m.remove('emailConfirmed');

      PlayerJsonSerializer serializer = new PlayerJsonSerializer();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, 'john@noemail.com');
      expect(player.age, 25);
      expect(player.score, 1000);
      expect(player.emailConfirmed, isNull);
    });

    // Ignore field
    test('IgnoreField', () {
      PlayerJsonSerializerIgnore serializer = new PlayerJsonSerializerIgnore();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, 'john@noemail.com');
      expect(player.age, 25);
      expect(player.score, 1000);
      expect(player.emailConfirmed, isNull);
    });

    // Ignore fields
    test('IgnoreFields', () {
      PlayerJsonSerializerIgnores serializer =
          new PlayerJsonSerializerIgnores();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, null);
      expect(player.age, null);
      expect(player.score, 1000);
      expect(player.emailConfirmed, isNull);
    });
  });

  group('Builtin.From.RenameKey', () {
    Map m;

    setUp(() {
      m = {};
      m['N'] = 'John';
      m['E'] = 'john@noemail.com';
      m['A'] = 25;
      m['S'] = 1000;
      m['emailConfirmed'] = true;
    });

    test('Rename key', () {
      PlayerJsonSerializerRename serializer = new PlayerJsonSerializerRename();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, 'john@noemail.com');
      expect(player.age, 25);
      expect(player.score, 1000);
      expect(player.emailConfirmed, true);
    });
  });
}
