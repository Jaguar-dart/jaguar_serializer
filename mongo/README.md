[![Build Status](https://travis-ci.org/Jaguar-dart/jaguar_serializer_mongo.svg?branch=master)](https://travis-ci.org/Jaguar-dart/jaguar_serializer_mongo)

# jaguar_serializer_mongo

Mongo serializer helpers for [jaguar_serializer](https://github.com/Jaguar-dart/jaguar_serializer)

# Convert Mongo's ObjectId

Mongo expects ids to be of type [ObjectId]()s. But in Code, we expect them to be `String`s most of the time. 
[MongoId] custom field processor can be used to automatically encode and decode to `ObjectId` from `String`.

```dart
@GenSerializer(fields: const {
  'id': const EnDecode(alias: '_id', processor: const MongoId()),
})
class PlayerSerializer extends Serializer<Player> with _$PlayerSerializer {
  PlayerSerializer();
}

/// Player model for the game
class Player {
  /// Id of the player
  String id;

  /// Name of the player
  String name;

  Player();
}
```

## Simple example

```dart
import 'package:mongo_dart/mongo_dart.dart';
import '../models/player/player.dart';

main() async {
  Db db = new Db('mongodb://localhost:27017/jaguar_mongo_test');
  await db.open();

  try {
    DbCollection coll = db.collection('one');
    ObjectId id = new ObjectId();
    ObjectId allianceId = new ObjectId();

    Player player = new Player()
      ..id = id.toHexString()
      ..allianceId = allianceId.toHexString()
      ..name = 'KnightsOT'
      ..email = 'knightsot@example.com'
      ..age = 27
      ..score = 500000
      ..emailConfirmed = true;

    await coll.insert(player.toMongo());

    Map result = await coll.findOne(where.id(id));
    print(result);

    Player decoded = Player.fromMap(result);
    print(decoded);
  } finally {
    await db.drop();
    await db.close();
  }
}
```