import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:collection/collection.dart';

part 'model.jser.dart';

@GenSerializer(
    serializers: const [AddressSerializer], fieldFormat: FieldFormat.snakeCase)
class PlayerSerializer extends Serializer<Player> with _$PlayerSerializer {}

@GenSerializer()
class AddressSerializer extends Serializer<Address> with _$AddressSerializer {}

class Player {
  String name;
  String email;
  int age;
  int score;
  bool emailConfirmed;
  int test;
  List<Address> address;

  Player(
      {this.name,
      this.email,
      this.age,
      this.score,
      this.emailConfirmed,
      this.test,
      this.address});

  String toString() =>
      'Player($name, $email, $age, $score, $emailConfirmed, $address)';

  bool operator ==(final other) {
    if (other is Player)
      return name == other.name &&
          email == other.email &&
          age == other.age &&
          score == other.score &&
          emailConfirmed == other.emailConfirmed &&
          test == other.test &&
          new IterableEquality().equals(address, other.address);
    return false;
  }
}

class Address {
  String street;
  String zipcode;
  String country;
  String city;

  Address({this.street, this.zipcode, this.country, this.city});

  bool operator ==(final other) {
    if (other is Address)
      return street == other.street &&
          zipcode == other.zipcode &&
          country == other.country &&
          city == other.city;
    return false;
  }

  String toString() => 'Address($street, $zipcode, $country, $city)';
}
