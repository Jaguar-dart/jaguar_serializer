library example.field_manipulation;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'field_manipulation_main.g.dart';

@GenSerializer(
  fields: const {
    'name': const EnDecode('N'),
    'email': const EnDecode('E'),
    'age': const EnDecode('A'),
    'score': const EnDecode('S'),
    'emailConfirmed': const Ignore(),
  },
)
class PlayerJsonSerializer extends Serializer<Player>
    with _$PlayerJsonSerializer {
  Player createModel() => new Player();

  PlayerJsonSerializer();
}

/// Player model for the game
class Player {
  /// Name of the player
  String name;

  /// Email of the player
  String email;

  /// Age of the player
  int age;

  /// Player score
  int score;

  /// Has the player confirmed his email?
  ///
  /// Should not be sent to client
  bool emailConfirmed;

  String toString() => 'Player($name, $email, $age, $score, $emailConfirmed)';
}

void main() {
  {
    PlayerJsonSerializer serializer = new PlayerJsonSerializer();
    Player player = serializer.fromMap({
      'N': 'John',
      'E': 'john@noemail.com',
      'A': 25,
      'S': 1000,
    });
    // Player(John, john@noemail.com, 25, 1000, null)
    print(player);
  }

  {
    Player player = new Player()
      ..name = 'John'
      ..email = 'john@noemail.com'
      ..age = 25
      ..score = 1000
      ..emailConfirmed = true;
    PlayerJsonSerializer serializer = new PlayerJsonSerializer();
    Map map = serializer.toMap(player);
    // {N: John, E: john@noemail.com, A: 25, S: 1000}
    print(map);
  }
}
