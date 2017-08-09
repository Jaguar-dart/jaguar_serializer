library serializer.test.models.player;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'nested.g.dart';

@GenSerializer()
class InnerModel1Serializer extends Serializer<InnerModel1>
    with _$InnerModel1Serializer {
  InnerModel1 createModel() => new InnerModel1();
}

@GenSerializer()
class InnerModel2Serializer extends Serializer<InnerModel2>
    with _$InnerModel2Serializer {
  InnerModel2 createModel() => new InnerModel2();
}

@GenSerializer(
  serializers: const [InnerModel1Serializer, InnerModel2Serializer],
)
class OuterModelSerializer extends Serializer<OuterModel>
    with _$OuterModelSerializer {
  OuterModel createModel() => new OuterModel();
}

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
