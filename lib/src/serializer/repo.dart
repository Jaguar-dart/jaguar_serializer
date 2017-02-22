part of jaguar_serializer.serializer;

class SerializerRepo {
  SerializerRepo({this.typeInfoKey: "@t"});

  final String typeInfoKey;
  final Map<Type, Serializer> _mapperType = {};
  final Map<String, Serializer> _mapperString = {};

  MapSerializer getByType(Type type) {
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    throw new Exception("No MapSerializer found for $type");
  }

  MapSerializer getByTypeKey(String key) {
    final serializer = _mapperString[key];
    if (serializer == null) {
      throw new Exception("No MapSerializer found for type key $key");
    }
    return serializer;
  }

  void add(Serializer serializer) {
    if (!_mapperType.containsKey(serializer.modelType)) {
      _mapperType[serializer.modelType] = serializer;
    }
    //TODO what if different serializers with same name are added?
    if (!_mapperString.containsKey(serializer.modelString)) {
      _mapperString[serializer.modelString] = serializer;
    }
  }

  dynamic to(dynamic object, {Type type}) {
    final Serializer serializer = getByType(type);

    if (serializer == null) {
      throw new Exception("Cannot find serializer for type $type");
    }

    return encode(serializer.to(object));
  }

  dynamic from(dynamic object, {Type type}) {
    Serializer serializer = getByType(type);

    final decoded = decode(object);

    if (serializer == null) {
      final String typeInfo = _objectToType(decoded);
      if (typeInfo is String) {
        serializer = getByTypeKey(typeInfo);
      }
      throw new Exception("Cannot find serializer for type $type");
    }

    if (decoded is Map) {}

    return serializer.from(decode(object));
  }

  dynamic encode(dynamic object) => object;

  dynamic decode(dynamic object) => object;

  String _objectToType(object) {
    String typeKey;
    if (object is Map) {
      typeKey = object[typeInfoKey];
    } else if (object is List<Map> &&
        object.length != 0 &&
        object.first is Map) {
      typeKey = object.first[typeInfoKey];
    }
    return typeKey;
  }
}
