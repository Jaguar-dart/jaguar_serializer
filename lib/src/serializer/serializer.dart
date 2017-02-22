library jaguar_serializer.serializer;

part 'custom_codec.dart';
part 'map_serializer.dart';
part 'map_maker.dart';
part 'repo.dart';

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
        SerializerRepo.getMapSerializerForType(object.runtimeType);
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
