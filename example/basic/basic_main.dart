library example.player;

import 'package:jaguar_serializer/serializer.dart';

part 'basic_main.g.dart';

@GenSerializer()
class PlayerJsonSerializer extends Object
    with JsonMixin<Player>, _$PlayerJsonSerializer
    implements MapSerializer<Player> {
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
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'emailConfirmed': true,
    });
    // Player(John, john@noemail.com, 25, 1000, true)
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
    // {name: John, email: john@noemail.com, age: 25, score: 1000, emailConfirmed: true}
    print(map);
  }
}
