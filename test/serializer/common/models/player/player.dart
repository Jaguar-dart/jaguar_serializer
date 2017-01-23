library serializer.test.models.player;

import 'package:jaguar_serializer/serializer.dart';

part 'player.g.dart';

@GenSerializer()
class PlayerJsonSerializer extends Object
    with JsonMixin<Player>, _$PlayerJsonSerializer, MapSerializer<Player> {
  Player createModel() => new Player();

  PlayerJsonSerializer();
}

@GenSerializer()
@IgnoreField(#emailConfirmed)
class PlayerJsonSerializerIgnore extends Object
    with JsonMixin<Player>, _$PlayerJsonSerializerIgnore,  MapSerializer<Player> {
  Player createModel() => new Player();

  PlayerJsonSerializerIgnore();
}

@GenSerializer()
@IgnoreFields(const <Symbol>[#emailConfirmed, #age, #email])
class PlayerJsonSerializerIgnores extends Object
    with JsonMixin<Player>, _$PlayerJsonSerializerIgnores, MapSerializer<Player> {
  Player createModel() => new Player();

  PlayerJsonSerializerIgnores();
}

@GenSerializer()
@EnDecodeField(#name, asAndFrom: 'N')
@EnDecodeFields(const {
  #email: 'E',
  #age: 'A',
})
@EncodeField(#score, as: 'S')
@DecodeField(#emailConfirmed, from: 'eC')
class PlayerJsonSerializerRename extends Object
    with JsonMixin<Player>, _$PlayerJsonSerializerRename, MapSerializer<Player> {
  Player createModel() => new Player();

  PlayerJsonSerializerRename();
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
