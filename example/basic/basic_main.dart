library example.player;

import 'dart:convert';

import 'package:jaguar_serializer/serializer.dart';

part 'basic_main.g.dart';

@GenSerializer()
class PlayerSerializer extends MapSerializer<Player> with _$PlayerSerializer {
  Player createModel() => new Player();

  PlayerSerializer() {
    providers[Address] = new AddressSerializer();
  }
}

@GenSerializer()
class AddressSerializer extends MapSerializer<Address> with _$AddressSerializer {
  Address createModel() => new Address();

  AddressSerializer();
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

  int test;

  Address address;

  String toString() => 'Player($name, $email, $age, $score, $emailConfirmed)';
}

class Address {
  String street;
  String zipcode;
  String country;
  String city;
}

void main() {
  SerializerJson serializer = new SerializerJson();
  serializer.addSerializer(new PlayerSerializer());

  {
    Player player = serializer.fromMap({
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'emailConfirmed': true,
      '@t': "Player"
    });
    // Player(John, john@noemail.com, 25, 1000, true)
    print(player);
  }

  {
    Player player = serializer.fromMap({
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'emailConfirmed': true
    }, type: Player);
    // Player(John, john@noemail.com, 25, 1000, true)
    print(player);
  }

  {
    Player player = new Player()
      ..name = 'John'
      ..email = 'john@noemail.com'
      ..age = 25
      ..score = 1000
      ..emailConfirmed = true
    ..address = (new Address()..city = "Paris");
    print(serializer.toDart(player));
    print(serializer.encode(player));
  }
}
