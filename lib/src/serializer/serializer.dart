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

  Object fromList(List objects, {Type type, bool useTypeInfo: true}) => objects
      .map((object) => fromObject(object, type: type, useTypeInfo: useTypeInfo))
      .toList();

  Object fromMap(Map map, {Type type, bool useTypeInfo: true, dynamic model}) {
    MapSerializer serializer;
    try {
      serializer = getMapSerializerForType(type) ??
          SerializerRepo.getMapSerializerForType(type);
    } catch (e) {
      if (useTypeInfo == false) {
        rethrow;
      }
      serializer = getMapSerializerFromMap(map) ??
          SerializerRepo.getMapSerializerFromMap(map);
    }
    return serializer.fromMap(map, model: model);
  }

  MapSerializer getMapSerializerFromMap(Map map) {
    if (map.containsKey(SerializerRepo.typeInfoKey) &&
        _mapperString.containsKey(map[SerializerRepo.typeInfoKey])) {
      return _mapperString[map[SerializerRepo.typeInfoKey]];
    }
    return null;
  }

  MapSerializer getMapSerializerForType(Type type) {
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    return null;
  }

  void addSerializer(MapSerializer serializer) {
    if (!_mapperType.containsKey(serializer.modelType)) {
      _mapperType[serializer.modelType] = serializer;
    }
    if (!_mapperString.containsKey(serializer.modelString)) {
      _mapperString[serializer.modelString] = serializer;
    }
  }

  String encode(dynamic object, {bool withTypeInfo: false}) =>
      dataEncode(toObject(object, withTypeInfo: withTypeInfo));

  dynamic decode(String data,
          {Type type, bool useTypeInfo: true, dynamic model}) =>
      fromObject(dataDecode(data),
          type: type, useTypeInfo: useTypeInfo, model: model);

  //TODO: method to decode List (JSON, YAML ...) to Stream

  String dataEncode(dynamic object);
  dynamic dataDecode(String data);
}
