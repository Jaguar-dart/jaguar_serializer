library serializer.test.builtin.test1;

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

    test('To map 1', () {
      PlayerJsonSerializer serializer = new PlayerJsonSerializer(player);
      Map result = serializer.toMap();
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, containsPair('emailConfirmed', true));
    });

    test('To map 2', () {
      player.emailConfirmed = false;

      PlayerJsonSerializer serializer = new PlayerJsonSerializer(player);

      Map result = serializer.toMap();
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result, containsPair('emailConfirmed', false));
    });

    test('IgnoreField', () {
      PlayerJsonSerializerIgnore serializer =
          new PlayerJsonSerializerIgnore(player);

      Map result = serializer.toMap();
      expect(result, containsPair('name', 'John'));
      expect(result, containsPair('email', 'john@noemail.com'));
      expect(result, containsPair('age', 25));
      expect(result, containsPair('score', 1000));
      expect(result['emailConfirmed'], isNull);
    });

    test('IgnoreFields', () {
      PlayerJsonSerializerIgnores serializer =
          new PlayerJsonSerializerIgnores(player);

      Map result = serializer.toMap();
      expect(result, containsPair('name', 'John'));
      expect(result['email'], isNull);
      expect(result['age'], isNull);
      expect(result, containsPair('score', 1000));
      expect(result['emailConfirmed'], isNull);
    });

    test('Rename key', () {
      PlayerJsonSerializerRename serializer =
          new PlayerJsonSerializerRename(player);
      Map result = serializer.toMap();
      expect(result, containsPair('N', 'John'));
      expect(result, containsPair('E', 'john@noemail.com'));
      expect(result, containsPair('A', 25));
      expect(result, containsPair('S', 1000));
      expect(result, containsPair('emailConfirmed', true));
    });
  });
}
