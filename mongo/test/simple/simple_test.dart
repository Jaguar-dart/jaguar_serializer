// Copyright (c) 2016, Ravi Teja Gudapati. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:mongo_dart/mongo_dart.dart';
import 'package:test/test.dart';
import '../models/player/player.dart';

main() {
  group('mongo.ObjectId', () {
    Db db;

    setUp(() async {
      db = new Db('mongodb://localhost:27017/jaguar_mongo_test');
      await db.open();
    });

    tearDown(() async {
      await db.drop();
      await db.close();
    });

    test('Encode', () async {
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

      await coll.insert(Player.serializer.toMap(player));

      Map result = await coll.findOne(where.id(id));
      expect(result['_id'], new isInstanceOf<ObjectId>());
      expect(result['_id'], id);

      expect(result['allianceId'], new isInstanceOf<ObjectId>());
      expect(result['allianceId'], allianceId);

      expect(result['name'], 'KnightsOT');
      expect(result['email'], 'knightsot@example.com');
      expect(result['age'], 27);
      expect(result['score'], 500000);
      expect(result['emailConfirmed'], isTrue);
    });

    test('Decode', () async {
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

      await coll.insert(Player.serializer.toMap(player));

      Map result = await coll.findOne(where.id(id));
      Player decoded = Player.serializer.fromMap(result);

      expect(decoded.id, new isInstanceOf<String>());
      expect(decoded.id, id.toHexString());

      expect(decoded.allianceId, new isInstanceOf<String>());
      expect(decoded.allianceId, allianceId.toHexString());

      expect(decoded.name, 'KnightsOT');
      expect(decoded.email, 'knightsot@example.com');
      expect(decoded.age, 27);
      expect(decoded.score, 500000);
      expect(decoded.emailConfirmed, isTrue);
    });
  });
}
