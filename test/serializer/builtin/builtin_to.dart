library serializer.test.builtin.to;

import 'package:test/test.dart';

import '../common/models/player/player.dart';

void main() {
  group('Builtin', () {
    Player player;

    setUp(() {
      player = new Player();
      player.name = 'John';
      player.email = 'john@noemail.com';
      player.age = 25;
      player.score = 1000;
      player.emailConfirmed = true;
    });

    // Check if toMap converts all fields to Map items
    test('To map', () {
      PlayerSerializer serializer = new PlayerSerializer();
      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, containsPair('emailConfirmed', true));
    });

    test('To map 2', () {
      player.emailConfirmed = null;

      PlayerSerializer serializer = new PlayerSerializer();

      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, isNot(contains('emailConfirmed')));
    });

    test('IgnoreField', () {
      PlayerSerializerIgnore serializer = new PlayerSerializerIgnore();

      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, isNot(contains('emailConfirmed')));
    });

    test('IgnoreFields', () {
      PlayerSerializerIgnores serializer = new PlayerSerializerIgnores();

      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result['email'], isNull);
      expect(result['age'], isNull);
      expect(result, containsPair('score', 1000));
      expect(result['emailConfirmed'], isNull);
    });

    test('Rename key', () {
      PlayerSerializerRename serializer = new PlayerSerializerRename();
      Map result = serializer.toMap(player);
      expect(result, containsPair('N', 'John'));
      expect(result, containsPair('E', 'john@noemail.com'));
      expect(result, containsPair('A', 25));
      expect(result, containsPair('S', 1000));
      expect(result, containsPair('emailConfirmed', true));
    });
  });
}
