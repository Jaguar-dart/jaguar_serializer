# jaguar_serializer
Format agnostic Serializer library that can be used in server and client for JSON, mongodb, postgresql, etc

# Design decisions

https://docs.google.com/document/d/1ugBHnmOg17PmACPa_yL0t4JV2dBWRjbzR_5363NrKPA/edit?usp=sharing

# Simple examples

## Simple serializer

```dart

library game.models.player;

import 'package:jaguar_serializer/serializer.dart';

@GenSerializer()
@IgnoreField(#emailConfirmed)
class PlayerJsonSerializerIgnore extends Object
    with JsonMixin, _$PlayerJsonSerializerIgnore
    implements MapSerializer<Player> {
  Player _player;

  Player get model => _player;

  PlayerJsonSerializerIgnore([Player player])
      : _player = player ?? new Player();
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
}
```

