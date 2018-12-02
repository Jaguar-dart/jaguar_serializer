import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/proto_impl.dart';

import 'test.pb.dart';
import 'test.serializer.dart';

main() {
  Person data = Person();
  data.id = 1;
  data.name = 'name';
  data.email = 'name@email.com';

  final List<int> buffer = data.writeToBuffer();

  //ProtoRepo serializer = ProtoRepo(serializers: [TestSerializer()]);

  final serializer = SerializerProtoRepo()..add(TestSerializer());

  dynamic person = serializer.from<Person>(buffer);

  dynamic personJson = serializer.from<Person>('{"1": "name", "2": 1, "3": "name@email.com"}');

  final List<int> personData = serializer.to(data);

  assert(const ListEquality().equals(personData, buffer));
  assert(person.name == 'name');
  assert(personJson.name == 'name');
}
