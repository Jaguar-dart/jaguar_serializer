import 'dart:convert';

import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:yaml/yaml.dart';
import 'package:yamlicious/yamlicious.dart';

part 'basic_main.jser.dart';

@GenSerializer(
    serializers: const [AddressSerializer], fieldFormat: FieldFormat.snakeCase)
class PlayerSerializer extends Serializer<Player> with _$PlayerSerializer {}

@GenSerializer()
class AddressSerializer extends Serializer<Address> with _$AddressSerializer {}

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

  List<Address> address;

  String toString() => 'Player($name, $email, $age, $score, $emailConfirmed)';
}

class Address {
  String street;
  String zipcode;
  String country;
  String city;
}

void jsonCodec() {
  SerializerRepo serializer =
      new JsonRepo(serializers: [new PlayerSerializer()]);
  {
    Player player = serializer.deserialize(json.encode({
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'email_confirmed': true,
      '@t': "Player",
      "address": [
        {
          'city': 'Paris',
        },
        {
          'city': 'London',
        },
      ]
    }));
    // Player(John, john@noemail.com, 25, 1000, true)
    print(player);
  }

  {
    Player player = serializer.deserialize(
        json.encode({
          'name': 'John',
          'email': 'john@noemail.com',
          'age': 25,
          'score': 1000,
          'email_confirmed': true
        }),
        type: Player);
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
      ..address = [(new Address()..city = "Paris")];
    print(serializer.serialize(player));
    print(serializer.serialize(player, withType: true));
  }
}

void yaml() {
  SerializerRepo serializer =
      new YamlRepo(serializers: [new PlayerSerializer()], typeKey: "_type");
  {
    Player player = serializer.deserialize(toYamlString({
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'emailConfirmed': true,
      '_type': "Player"
    }));
    // Player(John, john@noemail.com, 25, 1000, true)
    print(player);
  }

  {
    Player player = serializer.deserialize(
        toYamlString({
          'name': 'John',
          'email': 'john@noemail.com',
          'age': 25,
          'score': 1000,
          'emailConfirmed': true
        }),
        type: Player);
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
      ..address = [(new Address()..city = "Paris")];
    print(serializer.serialize(player));
    print(serializer.serialize(player, withType: true));
  }
}

void main() {
  // user basic serializer
  PlayerSerializer pSerializer = new PlayerSerializer();
  Player player = new Player()
    ..name = 'John'
    ..email = 'john@noemail.com'
    ..age = 25
    ..score = 1000
    ..emailConfirmed = true
    ..address = [(new Address()..city = "Paris")];
  print(pSerializer.toMap(player));
  print(pSerializer.toMap(player, withType: true));

  jsonCodec();
  //yaml();
}

/** 
 * Repository that serialize/deserialize YAML. 
 * 
 * Same usage as [SerializerRepo] 
 */
class YamlRepo extends SerializerRepo {
  YamlRepo(
      {List<Serializer> serializers,
      String typeKey: defaultTypeInfoKey,
      bool withType: false})
      : super(serializers: serializers, typeKey: typeKey, withType: withType);

  ///@nodoc
  dynamic encode(dynamic object) => toYamlString(object);

  ///@nodoc
  dynamic decode(dynamic object) => loadYaml(object as String);

  /** 
   * Deserialize a YAML String to an object. 
   * 
   * [object] can be a YAML String, a [List] of YAML String. 
   * 
   * See [SerializerRepo.from] for more information. 
   */
  @override
  dynamic deserialize(dynamic object, {Type type, String typeKey}) =>
      super.deserialize(object, type: type, typeKey: typeKey);

  /** 
   * Serialize an object to a YAML String 
   * 
   * [object] can be a [List], [Map] or a serializable object. 
   * 
   * See [SerializerRepo.to] for more information. 
   */
  @override
  dynamic serialize(dynamic object, {bool withType, String typeKey}) =>
      super.serialize(object, withType: withType, typeKey: typeKey);
}
