import 'package:jaguar_serializer/jaguar_serializer.dart';
import '../basic/model.dart';

void jsonCodec() {
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

/* TODO
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
*/

/* TODO
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
*/
