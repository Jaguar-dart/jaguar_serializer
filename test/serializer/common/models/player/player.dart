library serializer.test.models.player;

import 'package:jaguar_serializer/serializer.dart';

part 'player.g.dart';

@GenSerializer()
class PlayerSerializer extends MapSerializer<Player> with _$PlayerSerializer {
  Player createModel() => new Player();

  PlayerSerializer();
}

@GenSerializer()
@IgnoreField(#emailConfirmed)
class PlayerSerializerIgnore extends MapSerializer<Player>
    with _$PlayerSerializerIgnore {
  Player createModel() => new Player();

  PlayerSerializerIgnore();
}

@GenSerializer()
@IgnoreFields(const <Symbol>[#emailConfirmed, #age, #email])
class PlayerSerializerIgnores extends MapSerializer<Player>
    with _$PlayerSerializerIgnores {
  Player createModel() => new Player();

  PlayerSerializerIgnores();
}

@GenSerializer()
@EnDecodeField(#name, asAndFrom: 'N')
/* todo: does not work on browser
@EnDecodeFields(const {
  #email: 'E',
  #age: 'A',
})*/
@EncodeField(#score, as: 'S')
@DecodeField(#emailConfirmed, from: 'eC')
class PlayerSerializerRename extends MapSerializer<Player>
    with _$PlayerSerializerRename {
  Player createModel() => new Player();

  PlayerSerializerRename();
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
