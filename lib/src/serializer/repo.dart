part of jaguar_serializer.serializer;

class SerializerRepo {
  SerializerRepo._();

  static String typeInfoKey = "@t";
  static Map<Type, MapSerializer> _mapperType = {};
  static Map<String, MapSerializer> _mapperString = {};

  static MapSerializer getMapSerializerForType(Type type) {
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    //Todo: better exception, how to fix error ? how to add serializer ? ...
    throw new Exception("No MapSerializer found for $type");
  }

  static MapSerializer getMapSerializerFromMap(Map map) {
    if (map.containsKey(SerializerRepo.typeInfoKey) &&
        _mapperString.containsKey(map[SerializerRepo.typeInfoKey])) {
      return _mapperString[map[SerializerRepo.typeInfoKey]];
    }
    throw new Exception(
        "No MapSerializer found for ${map[SerializerRepo.typeInfoKey]}");
  }

  static void addSerializer(MapSerializer serializer) {
    if (!_mapperType.containsKey(serializer.modelType)) {
      _mapperType[serializer.modelType] = serializer;
    }
    if (!_mapperString.containsKey(serializer.modelString)) {
      _mapperString[serializer.modelString] = serializer;
    }
  }
}
