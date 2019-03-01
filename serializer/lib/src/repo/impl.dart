part of 'repo.dart';

class SerializerRepoImpl implements SerializerRepo {
  final Map<Type, Serializer> _mapperType = {};

  SerializerRepoImpl({List<Serializer> serializers}) {
    if (serializers is List) addAll(serializers);
  }

  Iterable<Serializer> get serializers => _mapperType.values;

  /// Return a [Serializer] for a Type
  Serializer<T> getByType<T>(Type type) => _mapperType[type] as Serializer<T>;

  /// Add a [Serializer] to the repository.
  ///
  /// If a [Serializer] using the same type is already in the repository, it
  /// won't be override.
  void add(Serializer serializer) {
    if (!_mapperType.containsKey(serializer.modelType())) {
      _mapperType[serializer.modelType()] = serializer;
    }
  }

  void addAll(Iterable<Serializer> serializers) => serializers.forEach(add);

  /// Serializes [object] to Dart built-in type
  dynamic to(dynamic object) {
    if (object is String || object is num || object is bool || object == null)
      return object;

    final Type type = object.runtimeType;

    if (object is Map) {
      if (object is! Map<String, dynamic>) {
        object = (object as Map).cast<String, dynamic>();
      }
      return _transformMapToDart(object as Map<String, dynamic>);
    } else if (object is Iterable) {
      return _transformIterableToDart(object);
    } else {
      final Serializer serializer = getByType(type);

      if (serializer == null)
        throw new Exception("Cannot find serializer for type $type");

      return serializer.toMap(object);
    }
  }

  /// Deserializes [object] to [T]
  T oneFrom<T>(dynamic object) {
    Serializer<T> ser = getByType(T);
    return _deserializeOne(object, ser);
  }

  /// Deserializes [object] ([List<dynamic>]) to [List<T>]
  List<T> listFrom<T>(List object) {
    Serializer<T> ser = getByType(T);
    final ret = List<T>()..length = object.length;
    for (int i = 0; i < object.length; i++)
      ret[i] = _deserializeOne(object[i], ser);
    return ret;
  }

  Map<String, T> mapFrom<T>(Map<String, dynamic> object) {
    Serializer<T> ser = getByType(T);
    if (ser == null) return object?.cast<String, T>();
    return from<T>(object) as Map<String, T>;
  }

  T _deserializeOne<T>(dynamic object, Serializer<T> ser) {
    if (object is String || object is num || object is bool || object == null)
      return object as T;

    if (object is Map) {
      if (ser == null) return object.cast<String, dynamic>() as T;
      return ser.fromMap(object);
    }

    throw Exception('Unknown type ${object.runtimeType}!');
  }

  /// Deserializes Dart built-in object to Dart PODO
  dynamic from<T>(dynamic object) {
    Serializer<T> ser = getByType(T);
    return _from<T>(object, ser: ser);
  }

  dynamic _from<T>(dynamic decoded, {Serializer<T> ser}) {
    if (decoded is String ||
        decoded is num ||
        decoded is bool ||
        decoded == null) return decoded;

    if (decoded is Iterable) {
      return decoded
          .map<dynamic>((dynamic obj) => _from(obj, ser: ser))
          .toList();
    } else if (decoded is Map) {
      if (ser == null) return decoded.cast<String, dynamic>();
      return ser.fromMap(decoded);
    } else {
      throw Exception('Unknown type ${decoded.runtimeType}!');
    }
  }

  Map<String, dynamic> _transformMapToDart(Map<String, dynamic> object) {
    final mapper = <String, dynamic>{};
    object.forEach((key, dynamic value) {
      final k = to(key) as String;
      if (value == null) {
        mapper[k] = null;
        return;
      }
      mapper[k] = to(value);
    });
    return mapper;
  }

  List _transformIterableToDart(Iterable object) =>
      object.map<dynamic>((dynamic obj) => to(obj)).toList();
}
