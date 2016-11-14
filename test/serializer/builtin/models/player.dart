library serializer.test.models.player;

import 'package:jaguar_serializer/serializer.dart';

part 'player.g.dart';

@GenSerializer()
class PlayerJsonSerializer extends Object
    with JsonMixin, _$PlayerJsonSerializer
    implements MapSerializer<Player> {
  Player _player;

  Player get model => _player;

  PlayerJsonSerializer([Player player]) : _player = player ?? new Player();
}

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

@GenSerializer()
@IgnoreFields(const <Symbol>[#emailConfirmed, #age, #email])
class PlayerJsonSerializerIgnores extends Object
    with JsonMixin, _$PlayerJsonSerializerIgnores
    implements MapSerializer<Player> {
  Player _player;

  Player get model => _player;

  PlayerJsonSerializerIgnores([Player player])
      : _player = player ?? new Player();
}

@GenSerializer()
@EnDecodeField(#name, asAndFrom: 'N')
@EnDecodeFields(const {
  #email: 'E',
  #age: 'A',
})
@EncodeField(#score, as: 'S')
@DecodeField(#score, from: 'S')
class PlayerJsonSerializerRename extends Object
    with JsonMixin, _$PlayerJsonSerializerRename
    implements MapSerializer<Player> {
  Player _player;

  Player get model => _player;

  PlayerJsonSerializerRename([Player player])
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
