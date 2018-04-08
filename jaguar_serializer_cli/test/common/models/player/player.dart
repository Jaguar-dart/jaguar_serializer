import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'player.g.dart';

@GenSerializer(
    fields: const {'emailConfirmed': const Property<bool>(isNullable: false)})
class PlayerSerializer extends Serializer<Player> with _$PlayerSerializer {}

@GenSerializer(ignore: const ['emailConfirmed'])
class PlayerSerializerIgnore extends Serializer<Player>
    with _$PlayerSerializerIgnore {}

@GenSerializer(ignore: const ['emailConfirmed', 'age', 'email'])
class PlayerSerializerIgnores extends Serializer<Player>
    with _$PlayerSerializerIgnores {}

@GenSerializer(fields: const {
  'name': const EnDecode<String>(alias: 'N'),
  'score': const EncodeOnly<int>(alias: 'S'),
  'emailConfirmed': const EnDecode<bool>(alias: 'eC'),
})
class PlayerSerializerRename extends Serializer<Player>
    with _$PlayerSerializerRename {}

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
