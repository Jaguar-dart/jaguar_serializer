import 'model.dart';

void main() {
  // user basic serializer
  PlayerSerializer plSer = new PlayerSerializer();
  Player player = new Player()
    ..name = 'John'
    ..email = 'john@noemail.com'
    ..age = 25
    ..score = 1000
    ..emailConfirmed = true
    ..address = [(new Address()..city = "Paris")];

  final Map map = plSer.toMap(player);
  print(map);

  Player decoded = plSer.fromMap(map);
  print(decoded);

  print(decoded == player);
}
