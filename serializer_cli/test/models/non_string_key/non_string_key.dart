import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'non_string_key.jser.dart';

class IntKeyProcessor
    implements FieldProcessor<Map<int, String>, Map<String, String>> {
  const IntKeyProcessor();

  @override
  Map<String, String> serialize(Map<int, String> value) {
    if (value == null) return null;
    final ret = <String, String>{};
    for (int key in value.keys) {
      ret[key?.toString()] = value[key];
    }
    return ret;
  }

  @override
  Map<int, String> deserialize(Map<String, String> value) {
    if (value == null) return null;
    final ret = <int, String>{};
    for (String key in value.keys) {
      if (key == null)
        ret[null] = value[key];
      else
        ret[int.tryParse(key)] = value[key];
    }
    return ret;
  }
}

class Model {
  Map<int, String> intKeyed;

  Model({this.intKeyed});

  bool operator ==(other) {
    if (other is Model) return MapEquality().equals(intKeyed, other.intKeyed);
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer(fields: const {
  'intKeyed': const Field(processor: const IntKeyProcessor()),
})
class ModelSerializer extends Serializer<Model> with _$ModelSerializer {}
