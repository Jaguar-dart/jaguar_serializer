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
    throw new Exception("No MapSerializer found for ${map[JaguarSerializer.type_info_key]}");
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

  Map<Type, MapSerializer> _mapperType = {};
  Map<String, MapSerializer> _mapperString = {};

  MapSerializer getMapSerializerForType(Type type) {
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    return null;
  }

  MapSerializer getMapSerializerFromMap(Map map) {
    if (map.containsKey(JaguarSerializer.type_info_key) &&
        _mapperString.containsKey(map[JaguarSerializer.type_info_key])) {
      return _mapperString[map[JaguarSerializer.type_info_key]];
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
}

/// Annotation used to request generation of serializer
class GenSerializer {
  const GenSerializer();
}

/// Annotation used to provide serializers for specific types
class ProvideSerializers {
  /// A mapping from Type to the serializer used for that Type
  final Map<String, Type> serializers;

  const ProvideSerializers(this.serializers);
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
  Object fromObject(Object object, {Type type, bool useTypeInfo: true, dynamic model}) {
    if (object is List) {
      return fromList(object, type: type, useTypeInfo: useTypeInfo);
    } else if (object is Map) {
      return fromMap(object, type: type, useTypeInfo: useTypeInfo, model: model);
    }
    return object;
  }

  Map toMap(Object object, {bool withTypeInfo: false}) {
    MapSerializer serializer = JaguarSerializer.getMapSerializerForType(object.runtimeType);
    return serializer.toMap(object, withTypeInfo: withTypeInfo);
  }

  List toList(List objects, {bool withTypeInfo: false}) =>
      objects.map((object) => toObject(object, withTypeInfo: withTypeInfo)).toList();

  Object toObject(Object object, {bool withTypeInfo: false}) {
    if (object is Iterable) {
      return toObject(object.toList(), withTypeInfo: withTypeInfo);
    }
    if (object is List) {
      return toList(object, withTypeInfo: withTypeInfo);
    } else if (object is Map) {
      object.forEach((key, value) {
        object[key] = toObject(object[key], withTypeInfo: withTypeInfo);
      });
      return object;
    }
    return toMap(object, withTypeInfo: withTypeInfo);
  }

  Object fromList(List objects, {Type type, bool useTypeInfo: true}) =>
      objects.map((object) => fromObject(object, type: type, useTypeInfo: useTypeInfo)).toList();

  Object fromMap(Map map, {Type type, bool useTypeInfo: true, dynamic model}) {
    MapSerializer serializer;
    try {
      serializer = JaguarSerializer.getMapSerializerForType(type);
    } catch (e) {
      if (useTypeInfo == false) {
        rethrow;
      }
      serializer = JaguarSerializer.getMapSerializerFromMap(map);
    }
    return serializer.fromMap(map, model: model);
  }

  void addSerializer(MapSerializer serializer) {
    JaguarSerializer.addSerializer(serializer);
  }

  String encode(Object object, {bool withTypeInfo: false}) => _encoder(toObject(object, withTypeInfo: withTypeInfo));
  Object decode(String data, {Type type, bool useTypeInfo: true, dynamic model}) =>
      fromObject(_decoder(data), type: type, useTypeInfo: useTypeInfo, model: model);

  Encoder _encoder;
  Decoder _decoder;
  Serializer(this._encoder, this._decoder);
}

typedef String Encoder(Object object);
typedef Object Decoder(String data);
