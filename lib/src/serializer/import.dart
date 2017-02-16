library serializer.serializer;

part 'field_annotations.dart';

part 'custom_codec.dart';

abstract class JaguarSerializer {
  static String type_info_key = "@t";
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
    if (map.containsKey(JaguarSerializer.type_info_key) &&
        _mapperString.containsKey(map[JaguarSerializer.type_info_key])) {
      return _mapperString[map[JaguarSerializer.type_info_key]];
    }
    throw new Exception(
        "No MapSerializer found for ${map[JaguarSerializer.type_info_key]}");
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

/// Map serializer interface
abstract class MapSerializer<ModelType> {
  /// Encodes model to [Map]
  Map toMap(ModelType model, {bool withTypeInfo: false});

  /// Decodes model from [Map]
  ModelType fromMap(Map map, {ModelType model}) {
    if (model is! ModelType) {
      model = createModel();
    }

    return model;
  }

  Type get modelType => ModelType;

  String get modelString => "$ModelType";

  ModelType createModel();
}

/// Annotation used to request generation of serializer
class GenSerializer {
  const GenSerializer();
}

/// Annotation used to provide serializers for specific types
class ProvideSerializer {
  /// A mapping from Type to the serializer used for that Type
  final Type field;
  final Type serializer;

  const ProvideSerializer(this.field, this.serializer);
}

class MapMaker<KF, VF, KT, VT> {
  Map<KT, VT> _model;

  MapMaker(Map<KF, VF> map, [KT keyMapper(KF from), VT valueMapper(VF from)]) {
    if (map is Map) {
      _model = new Map<KT, VT>();
      map.forEach((KF key, VF value) {
        _model[keyMapper(key)] = valueMapper(value);
      });
    }
  }

  Map<KT, VT> get model => _model;
}

abstract class Serializer {
  Map<Type, MapSerializer> _mapperType = {};
  Map<String, MapSerializer> _mapperString = {};

  dynamic fromObject(dynamic object,
      {Type type, bool useTypeInfo: true, dynamic model}) {
    if (object is List) {
      return fromList(object, type: type, useTypeInfo: useTypeInfo);
    } else if (object is Map) {
      return fromMap(object,
          type: type, useTypeInfo: useTypeInfo, model: model);
    }
    return object;
  }

  Map toMap(dynamic object, {bool withTypeInfo: false}) {
    MapSerializer serializer = getMapSerializerForType(object.runtimeType) ??
        JaguarSerializer.getMapSerializerForType(object.runtimeType);
    return serializer.toMap(object, withTypeInfo: withTypeInfo);
  }

  List toList(List objects, {bool withTypeInfo: false}) => objects
      .map((object) => toObject(object, withTypeInfo: withTypeInfo))
      .toList();

  dynamic toObject(dynamic object, {bool withTypeInfo: false}) {
    if (object is List) {
      return toList(object, withTypeInfo: withTypeInfo);
    } else if (object is Iterable) {
      return toList(object.toList(), withTypeInfo: withTypeInfo);
    } else if (object is Map) {
      Map newMap = {};
      object.forEach((key, value) {
        newMap[key] = toObject(object[key], withTypeInfo: withTypeInfo);
      });
      return newMap;
    } else if (object is String || object is num) {
      return object;
    }
    return toMap(object, withTypeInfo: withTypeInfo);
  }

  Object fromList(List objects, {Type type, bool useTypeInfo: true}) => objects
      .map((object) => fromObject(object, type: type, useTypeInfo: useTypeInfo))
      .toList();

  Object fromMap(Map map, {Type type, bool useTypeInfo: true, dynamic model}) {
    MapSerializer serializer;
    try {
      serializer = getMapSerializerForType(type) ??
          JaguarSerializer.getMapSerializerForType(type);
    } catch (e) {
      if (useTypeInfo == false) {
        rethrow;
      }
      serializer = getMapSerializerFromMap(map) ??
          JaguarSerializer.getMapSerializerFromMap(map);
    }
    return serializer.fromMap(map, model: model);
  }

  MapSerializer getMapSerializerFromMap(Map map) {
    if (map.containsKey(JaguarSerializer.type_info_key) &&
        _mapperString.containsKey(map[JaguarSerializer.type_info_key])) {
      return _mapperString[map[JaguarSerializer.type_info_key]];
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
      _encoder(toObject(object, withTypeInfo: withTypeInfo));

  dynamic decode(String data,
          {Type type, bool useTypeInfo: true, dynamic model}) =>
      fromObject(_decoder(data),
          type: type, useTypeInfo: useTypeInfo, model: model);

  //TODO: method to decode List (JSON, YAML ...) to Stream

  Encoder _encoder;
  Decoder _decoder;

  Serializer(this._encoder, this._decoder);
}

typedef String Encoder(dynamic object);

typedef dynamic Decoder(String data);

dynamic convertKeysToString(dynamic object) {
  if (object is List) {
    return object.map((Object inner) => convertKeysToString(inner)).toList();
  } else if (object is Map) {
    // fixme, handle all possibilities
    Map newMap = {};
    if (_mapStringKeysTester.keys.runtimeType == object.keys.runtimeType ||
        _constMapStringKeysTester.keys.runtimeType == object.keys.runtimeType) {
      for (var key in object.keys) {
        if (key is String || key is num) {
          //fixme: find a better way to convert keys to String
          newMap[key.toString()] = convertKeysToString(object[key]);
        } else {
          //Todo: better exception
          throw new Exception(
              "Error in map keys: Impossible to convert a ${key.runtimeType} to a String");
        }
      }
    } else {
      for (var key in object.keys) {
        newMap[key] = convertKeysToString(object[key]);
      }
    }
    return newMap;
  }
  return object;
}

///https://github.com/dart-lang/sdk/issues/28548
Map<String, dynamic> _mapStringKeysTester = {};
const Map<String, dynamic> _constMapStringKeysTester = const {};
