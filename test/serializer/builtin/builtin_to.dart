library serializer.test.builtin.to;

import 'package:test/test.dart';

import 'models/player.dart';

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
      PlayerJsonSerializer serializer = new PlayerJsonSerializer();
      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, containsPair('emailConfirmed', true));
    });

    test('To map 2', () {
      player.emailConfirmed = null;

      PlayerJsonSerializer serializer = new PlayerJsonSerializer();

      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, containsPair('emailConfirmed', isNull));
    });

    test('IgnoreField', () {
      PlayerJsonSerializerIgnore serializer = new PlayerJsonSerializerIgnore();

      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, isNot(contains('emailConfirmed')));
    });

    test('IgnoreFields', () {
      PlayerJsonSerializerIgnores serializer =
          new PlayerJsonSerializerIgnores();

      Map result = serializer.toMap(player);
      expect(result, containsPair('name', 'John'));
      expect(result['email'], isNull);
      expect(result['age'], isNull);
      expect(result, containsPair('score', 1000));
      expect(result['emailConfirmed'], isNull);
    });

    test('Rename key', () {
      PlayerJsonSerializerRename serializer = new PlayerJsonSerializerRename();
      Map result = serializer.toMap(player);
      expect(result, containsPair('N', 'John'));
      expect(result, containsPair('E', 'john@noemail.com'));
      expect(result, containsPair('A', 25));
      expect(result, containsPair('S', 1000));
      expect(result, containsPair('emailConfirmed', true));
    });
  });
}
