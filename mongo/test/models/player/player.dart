library serializer.test.models.player;

import 'package:mongo_dart/mongo_dart.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer_mongo/jaguar_serializer_mongo.dart';

part 'player.jser.dart';

@GenSerializer(fields: const {
  'id': const EnDecode(alias: '_id', processor: const MongoId()),
  'allianceId': const EnDecode(processor: const MongoId()),
})
class PlayerSerializer extends Serializer<Player> with _$PlayerSerializer {
  PlayerSerializer();
}

/// Player model for the game
class Player {
  /// Id of the player
  String id;

  /// Id of the alliance the player belongs to
  String allianceId;

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

  Player();

  static Player fromMap(Map map) => serializer.fromMap(map);

  static PlayerSerializer serializer = new PlayerSerializer();

  Map toMongo() => serializer.toMap(this);

  String toString() => toMongo().toString();
}
