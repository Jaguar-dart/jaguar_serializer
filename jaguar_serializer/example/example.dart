import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'example.jser.dart';

class Player {
  String name;
  String email;
  int score;
  List<Address> address;

  Player({this.name, this.email, this.score, this.address});

  String toString() => 'Player($name, $email, $score, $address)';
}

class Address {
  String street;
  String city;

  Address({this.street, this.city});

  String toString() => 'Address($street, $city)';
}

@GenSerializer()
class PlayerSerializer extends _$PlayerSerializer {

}

@GenSerializer()
class AddressSerializer extends _$AddressSerializer {

}

void main() {
  // user basic serializer
  PlayerSerializer plSer = new PlayerSerializer();
  Player player = new Player(
      name: 'John',
      email: 'john@noemail.com',
      score: 1000,
      address: [(new Address(street: 'Skögsangavägen', city: 'Stockholm'))]);

  final Map<String, dynamic> map = plSer.encode(player);
  print(map);

  Player decoded = plSer.decode(map);
  print(decoded);
}
