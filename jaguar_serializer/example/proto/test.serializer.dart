
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'test.pb.dart';

part 'test.serializer.jser.dart';

@GenSerializer(ignore: ['info_', 'eventPlugin', 'unknownFields'])
class TestSerializer extends Serializer<dynamic, Person> with _$TestSerializer {
}
