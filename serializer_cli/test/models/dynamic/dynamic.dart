import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'dynamic.jser.dart';

class DynamicModel {
  dynamic scalar;
  List<dynamic> list;
  Map<String, dynamic> map;

  DynamicModel({this.scalar, this.list, this.map});

  bool operator ==(other) {
    if (other is DynamicModel)
      return scalar == other.scalar &&
          DeepCollectionEquality().equals(list, other.list) &&
          DeepCollectionEquality().equals(map, other.map);
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer()
class DynamicModelSerializer extends Serializer<DynamicModel>
    with _$DynamicModelSerializer {
  // TODO
}

@GenSerializer(fields: const {
  'scalar': const Field(processor: const PassProcessor()),
  'list': const Field(processor: const PassProcessor()),
  'map': const Field(processor: const PassProcessor()),
})
class DynamicPassSerializer extends Serializer<DynamicModel>
    with _$DynamicPassSerializer {
  // TODO
}
