library serializer.test.models.player;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'player.g.dart';

@GenSerializer()
class PlayerSerializer extends Serializer<Player> with _$PlayerSerializer {
  Player createModel() => new Player();

  PlayerSerializer();
}

@GenSerializer(ignore: const ['emailConfirmed'])
class PlayerSerializerIgnore extends Serializer<Player>
    with _$PlayerSerializerIgnore {
  Player createModel() => new Player();

  PlayerSerializerIgnore();
}

@GenSerializer(ignore: const ['emailConfirmed', 'age', 'email'])
class PlayerSerializerIgnores extends Serializer<Player>
    with _$PlayerSerializerIgnores {
  Player createModel() => new Player();

  PlayerSerializerIgnores();
}

@GenSerializer(fields: const {
  'name': const EnDecode(alias: 'N'),
  'score': const EncodeOnly(alias: 'S'),
  'emailConfirmed': const EnDecode(alias: 'eC'),
})
class PlayerSerializerRename extends Serializer<Player>
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
