part of jaguar_serializer.serializer;

const String defaultTypeInfoKey = "@t";

class SerializerRepo {
  SerializerRepo({this.typeInfoKey: defaultTypeInfoKey});

  final String typeInfoKey;
  final Map<Type, Serializer> _mapperType = {};
  final Map<String, Serializer> _mapperString = {};

  Serializer getByType(Type type) {
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    throw new Exception("No Serializer found for $type");
  }

  Serializer getByTypeKey(String key) {
    final serializer = _mapperString[key];
    if (serializer == null) {
      throw new Exception("No Serializer found for type key $key");
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

  dynamic _to(dynamic object,
      {Type type, bool withTypeInfo: false, String useTypeInfoKey}) {
    useTypeInfoKey ??= typeInfoKey;
    if (object is String || object is num) {
      return object;
    }
    final Serializer serializer = getByType(type);

    if (serializer == null) {
      throw new Exception("Cannot find serializer for type $type");
    }

    return serializer.to(object,
        withTypeInfo: withTypeInfo, typeInfoKey: useTypeInfoKey);
  }

  dynamic to(dynamic object,
      {bool withTypeInfo: false, String useTypeInfoKey}) {
    useTypeInfoKey ??= typeInfoKey;
    if (object is Iterable) {
      return encode(object
          .map((obj) => _to(obj,
              type: obj.runtimeType,
              withTypeInfo: withTypeInfo,
              useTypeInfoKey: useTypeInfoKey))
          .toList());
    } else if (object is Map) {
      Map map = {};
      for (var key in object.keys) {
        map[key] = _to(object[key],
            type: object[key].runtimeType,
            withTypeInfo: withTypeInfo,
            useTypeInfoKey: useTypeInfoKey);
      }
      return encode(map);
    }
    return encode(_to(object,
        type: object.runtimeType,
        withTypeInfo: withTypeInfo,
        useTypeInfoKey: useTypeInfoKey));
  }

  dynamic _from(dynamic decoded, {Type type, String useTypeInfoKey}) {
    Serializer serializer;

    try {
      serializer = getByType(type);
    } catch (e) {
      final String typeInfo = _objectToType(decoded, useTypeInfoKey);
      if (typeInfo is String) {
        serializer = getByTypeKey(typeInfo);
      }
    }
    if (serializer == null) {
      throw new Exception("Cannot find serializer for type $type");
    }

    return serializer.from(decoded);
  }

  dynamic from(dynamic object, {Type type, String useTypeInfoKey}) {
    useTypeInfoKey ??= typeInfoKey;
    final decoded = object is String ? decode(object) : object;

    if (decoded is Iterable) {
      return decoded
          .map((obj) => _from(obj, type: type, useTypeInfoKey: useTypeInfoKey))
          .toList();
    }
    return _from(decoded, type: type, useTypeInfoKey: useTypeInfoKey);
  }

  dynamic encode(dynamic object) => object;

  dynamic decode(dynamic object) => object;

  String _objectToType(object, String infoKey) {
    String typeKey;
    if (object is Map) {
      typeKey = object[infoKey];
    } else if (object is List<Map> &&
        object.length != 0 &&
        object.first is Map) {
      typeKey = object.first[infoKey];
    }
    return typeKey;
  }
}
