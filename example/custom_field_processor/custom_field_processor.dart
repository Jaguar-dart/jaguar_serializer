library example.field_manipulation;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'custom_field_processor.g.dart';

class MongoId implements FieldProcessor<String, ObjectId> {
  const MongoId();

  String deserialize(ObjectId input) {
    return input.toHexString();
  }

  ObjectId serialize(String value) {
    return new ObjectId.fromHexString(value);
  }
}

@GenSerializer(fields: const {
  'id': const EnDecode<String>(alias: '_id', processor: const MongoId())
})
class PlayerMongoSerializer extends Serializer<Player>
    with _$PlayerMongoSerializer {}

/// Player model for the game
class Player {
  String id;

  /// Name of the player
  String name;

  /// Email of the player
  String email;

  String toString() => 'Player($id, $name, $email)';
}

void main() {
  {
    PlayerMongoSerializer serializer = new PlayerMongoSerializer();
    Player player = serializer.fromMap(<String, dynamic>{
      '_id': new ObjectId(),
      'name': 'John',
      'email': 'john@noemail.com',
    });
    // Player(581f4dacfda7b4f46b878489, John, john@noemail.com)
    print(player);
  }

  {
    Player player = new Player()
      ..id = '1' * 24
      ..name = 'John'
      ..email = 'john@noemail.com';
    PlayerMongoSerializer serializer = new PlayerMongoSerializer();
    Map map = serializer.toMap(player);
    // {_id: ObjectId("111111111111111111111111"), name: John, email: john@noemail.com}
    print(map);
  }
}
