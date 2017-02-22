library jaguar_serializer.serializer;

part 'custom_codec.dart';
part 'map_serializer.dart';
part 'map_maker.dart';
part 'repo.dart';

abstract class Serializer<ModelType> implements MapSerializer<ModelType> {
  dynamic to(dynamic model) {
    if (model is ModelType) {
      return toMap(model);
    } else if (model is List<ModelType>) {
      return model.map((ModelType model) => toMap(model)).toList();
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  dynamic from(dynamic object) {
    if (object is Map) {
      return fromMap(object);
    } else if (object is List<Map>) {
      return object.map((Map map) => fromMap(map)).toList();
    } else {
      throw new Exception("Unknown object type received!");
    }
  }
}
