import 'package:jaguar_serializer/jaguar_serializer.dart';
import './example.dart';

void main() {
  SerializerRepo serializer =
      new JsonRepo(serializers: [new PlayerSerializer()]);
  {
    Player player = serializer.from<Player>({
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'email_confirmed': true,
      "address": [
        {
          'city': 'Paris',
        },
        {
          'city': 'London',
        },
      ]
    });
    // Player(John, john@noemail.com, 25, 1000, true)
    print(player);
  }

  /*
  {
    Player player = serializer.from({
      'name': 'John',
      'email': 'john@noemail.com',
      'age': 25,
      'score': 1000,
      'email_confirmed': true
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
      ..emailConfirmed = true
      ..address = [(new Address()..city = "Paris")];
    print(serializer.to(player));
    print(serializer.to(player));
  }
  */
}
