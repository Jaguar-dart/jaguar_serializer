library jaguar_serializer_mongo.example_simple;

import 'package:mongo_dart/mongo_dart.dart';
import '../../test/models/player/player.dart';

main() async {
  Db db = new Db('mongodb://localhost:27017/jaguar_mongo_test');
  await db.open();

  try {
    DbCollection coll = db.collection('one');
    ObjectId id = ObjectId();
    ObjectId allianceId = ObjectId();

    Player player = Player()
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
