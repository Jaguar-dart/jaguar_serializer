library serializer.test.builtin.from;

import 'package:test/test.dart';

import '../common/models/player/player.dart';

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
    test('From map', () {
      PlayerSerializer serializer = new PlayerSerializer();
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

      PlayerSerializer serializer = new PlayerSerializer();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, 'john@noemail.com');
      expect(player.age, 25);
      expect(player.score, 1000);
      expect(player.emailConfirmed, isNull);
    });

    // Ignore field
    test('IgnoreField', () {
      PlayerSerializerIgnore serializer = new PlayerSerializerIgnore();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, 'john@noemail.com');
      expect(player.age, 25);
      expect(player.score, 1000);
      expect(player.emailConfirmed, isNull);
    });

    // Ignore fields
    test('IgnoreFields', () {
      PlayerSerializerIgnores serializer = new PlayerSerializerIgnores();
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
      m['email'] = 'john@noemail.com';
      m['age'] = 25;
      m['S'] = 1000;
      m['eC'] = true;
    });

    test('Rename key', () {
      PlayerSerializerRename serializer = new PlayerSerializerRename();
      Player player = serializer.fromMap(m);
      expect(player.name, 'John');
      expect(player.email, 'john@noemail.com');
      expect(player.age, 25);
      expect(player.score, null);
      expect(player.emailConfirmed, true);
    });
  });
}
