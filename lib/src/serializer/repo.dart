part of jaguar_serializer.serializer;

class SerializerRepo {
  SerializerRepo({this.typeInfoKey: "@t"});

  final String typeInfoKey;
  final Map<Type, Serializer> _mapperType = {};
  final Map<String, Serializer> _mapperString = {};

  MapSerializer getMapSerializerForType(Type type) {
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    //Todo: better exception, how to fix error ? how to add serializer ? ...
    throw new Exception("No MapSerializer found for $type");
  }

  MapSerializer getMapSerializerFromMap(Map map) {
    if (map.containsKey(typeInfoKey) &&
        _mapperString.containsKey(map[typeInfoKey])) {
      return _mapperString[map[typeInfoKey]];
    }
    throw new Exception(
        "No MapSerializer found for ${map[typeInfoKey]}");
  }

  void addSerializer(Serializer serializer) {
    if (!_mapperType.containsKey(serializer.modelType)) {
      _mapperType[serializer.modelType] = serializer;
    }
    if (!_mapperString.containsKey(serializer.modelString)) {
      _mapperString[serializer.modelString] = serializer;
    }
  }

  dynamic to(dynamic object, {Type type}) {
    final Serializer serializer = getMapSerializerForType(type);

    if(serializer == null) {
      throw new Exception("Cannot find serializer for type $type");
    }

    return encode(serializer.to(object));
  }

  dynamic from(dynamic object, {Type type}) {
    final Serializer serializer = getMapSerializerForType(type);

    if(serializer == null) {
      throw new Exception("Cannot find serializer for type $type");
    }

    return serializer.from(decode(object));
  }

  dynamic encode(dynamic object) => object;

  dynamic decode(dynamic object) => object;
}
