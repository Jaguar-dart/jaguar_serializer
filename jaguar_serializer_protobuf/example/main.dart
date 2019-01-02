import 'package:collection/collection.dart';
import 'package:jaguar_serializer_protobuf/proto_repo.dart';

import 'test.pb.dart';

main() {
  Person data = Person();
  data.id = 1;
  data.name = 'name';
  data.email = 'name@email.com';

  final List<int> buffer = data.writeToBuffer();

  final serializer = ProtoSerializerRepo()
    ..add((data) => Person.fromBuffer(data));

  dynamic person = serializer.from<Person>(buffer);
  final List<int> personData = serializer.to(data);

  final serializerJson = ProtoSerializerRepo(isJsonFormatEnabled: true)
    ..add((data) => Person.fromBuffer(data),
        toJson: (data) => Person.fromJson(data));
  dynamic personJson = serializerJson
      .from<Person>('{"1": "name", "2": 1, "3": "name@email.com"}');

  assert(const ListEquality().equals(personData, buffer));
  assert(person.name == 'name');
  assert(personJson.name == 'name');
}
