library serializer.test.models.player;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'nested.g.dart';

@GenSerializer()
class InnerModel1Serializer extends Serializer<InnerModel1>
    with _$InnerModel1Serializer {}

@GenSerializer()
class InnerModel2Serializer extends Serializer<InnerModel2>
    with _$InnerModel2Serializer {}

@GenSerializer(
  serializers: const [InnerModel1Serializer, InnerModel2Serializer],
)
class OuterModelSerializer extends Serializer<OuterModel>
    with _$OuterModelSerializer {}

class InnerModel1 {
  int number;
}

class InnerModel2 {
  String name;
}

class OuterModel {
  String id;

  List<InnerModel1> list;

  Map<String, InnerModel2> map;
}
