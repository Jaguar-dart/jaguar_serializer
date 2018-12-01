import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/proto_impl.dart';

import 'test.pb.dart';

main() {
  Person data = Person();
  data.id = 1;
  data.name = 'name';
  data.email = 'name@email.com';

  final List<int> buffer = data.writeToBuffer();

  //ProtoRepo serializer = ProtoRepo(serializers: [TestSerializer()]);

  final serializer = SerializerProtoRepo()..add(PersonSerializer());

  dynamic person = serializer.from<Person>(buffer);

  dynamic personJson = serializer.from<Person>('{"1": "name", "2": 1, "3": "name@email.com"}');

  final List<int> personData = serializer.to(data);

  assert(const ListEquality().equals(personData, buffer));
  assert(person.name == 'name');
  assert(personJson.name == 'name');
}

class PersonSerializer extends Serializer<dynamic, Person> {
  PersonSerializer() : super(_toBuffer, _fromBuffer);

  static List<int> _toBuffer(Person product) => product.writeToBuffer();

  static Person _fromBuffer(dynamic buffer) {
    if (buffer is String) {
      return Person.fromJson(buffer);
    }
    return Person.fromBuffer(buffer as List<int>);
  }

  @override
  clone(object) {
    return object.clone();
  }
}
