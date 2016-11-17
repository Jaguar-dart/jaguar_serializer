[![Build Status](https://travis-ci.org/Jaguar-dart/jaguar_serializer.svg?branch=master)](https://travis-ci.org/Jaguar-dart/jaguar_serializer)

# jaguar_serializer
Format agnostic Serializer library that can be used in server and client for JSON, mongodb, postgresql, etc

# Simple examples

## Simple serializer

```dart
library example.player;

import 'package:jaguar_serializer/serializer.dart';

part 'basic_main.g.dart';

@GenSerializer()
class PlayerJsonSerializer extends Object
    with JsonMixin, _$PlayerJsonSerializer
    implements MapSerializer<Player> {
  Player createModel() => new Player();

  PlayerJsonSerializer();
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

  String toString() => 'Player($name, $email, $age, $score, $emailConfirmed)';
}

void main() {
  {
    PlayerJsonSerializer serializer = new PlayerJsonSerializer();
    Player player = serializer.fromMap({
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'emailConfirmed': true,
    });
    // Player(John, john@noemail.com, 25, 1000, true)
    print(player);
  }

  {
    Player player = new Player()
      ..name = 'John'
      ..email = 'john@noemail.com'
      ..age = 25
      ..score = 1000
      ..emailConfirmed = true;
    PlayerJsonSerializer serializer = new PlayerJsonSerializer();
    Map map = serializer.toMap(player);
    // {name: John, email: john@noemail.com, age: 25, score: 1000, emailConfirmed: true}
    print(map);
  }
}
```

## Field and key manipulation

```dart
library example.field_manipulation;

import 'package:jaguar_serializer/serializer.dart';

part 'field_manipulation_main.g.dart';

@GenSerializer()
@IgnoreField(#emailConfirmed)
@EnDecodeFields(const {
  #name: 'N',
  #email: 'E',
  #age: 'A',
  #score: 'S',
})
class PlayerJsonSerializer extends Object
    with JsonMixin, _$PlayerJsonSerializer
    implements MapSerializer<Player> {
  Player createModel() => new Player();

  PlayerJsonSerializer();
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

  String toString() => 'Player($name, $email, $age, $score, $emailConfirmed)';
}

void main() {
  {
    PlayerJsonSerializer serializer = new PlayerJsonSerializer();
    Player player = serializer.fromMap({
      'N': 'John',
      'E': 'john@noemail.com',
      'A': 25,
      'S': 1000,
    });
    // Player(John, john@noemail.com, 25, 1000, null)
    print(player);
  }

  {
    Player player = new Player()
      ..name = 'John'
      ..email = 'john@noemail.com'
      ..age = 25
      ..score = 1000
      ..emailConfirmed = true;
    PlayerJsonSerializer serializer = new PlayerJsonSerializer();
    Map map = serializer.toMap(player);
    // {N: John, E: john@noemail.com, A: 25, S: 1000}
    print(map);
  }
}
```

## Custom field processor

```dart
library example.field_manipulation;

import 'package:jaguar_serializer/serializer.dart';
import 'package:mongo_dart/mongo_dart.dart' as mgo;

part 'custom_field_processor.g.dart';

@DefineFieldProcessor()
class MongoId implements FieldProcessor<String, mgo.ObjectId> {
  final Symbol field;

  const MongoId(this.field);

  String from(mgo.ObjectId input) {
    return input.toHexString();
  }

  mgo.ObjectId to(String value) {
    return new mgo.ObjectId.fromHexString(value);
  }
}

@GenSerializer()
@MongoId(#id)
@EnDecodeField(#id, asAndFrom: '_id')
class PlayerMongoSerializer extends Object
    with JsonMixin, _$PlayerMongoSerializer
    implements MapSerializer<Player> {
  Player createModel() => new Player();

  PlayerMongoSerializer();
}

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
    Player player = serializer.fromMap({
      '_id': new mgo.ObjectId(),
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
```