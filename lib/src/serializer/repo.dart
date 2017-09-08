library jaguar_serializer.serializer.repo;

import '../serializer/serializer.dart';

/// Default key added to a serialize Object to add his [Type]
const String defaultTypeInfoKey = "@t";

/// Repository that contains [Serializer] for a [Type].
///
/// Example:
///
///     SerializerRepo repository = new SerializerRepo();
///     respository.add(new UserSerializer());
///
///     User user = new User();
///
///     // serialize
///     Map<String, dynamic> map = repository.serialize(user);
///     List<Map<String,dynamic>> list = repository.serialize([ user ] );
///
///     // deserialize
///     user = repository.deserialize(map, type: User);
///     List<User> users = repository.deserialize(list, type: User);
class SerializerRepo {
  final Map<Type, Serializer> _mapperType = {};
  final Map<String, Serializer> _mapperString = {};

  SerializerRepo(
      {List<Serializer> serializers,
      String typeKey: defaultTypeInfoKey,
      bool withType: false})
      : _typeKey = typeKey,
        _withType = withType {
    if (serializers is List) addAll(serializers);
  }

  /// Enable typeInfoKey or not (false by default)
  final bool _withType;

  /// Key added to a map when serializing an Object
  final String _typeKey;

  String getTypeKey() => _typeKey;

  /// Return a [Serializer] for a Type
  ///
  /// Throw an [Exception] if no [Serializer]
  Serializer getByType(Type type) {
    if (type == dynamic || type == Null) return null;
    if (_mapperType.containsKey(type)) {
      return _mapperType[type];
    }
    throw new Exception("No Serializer found for $type");
  }

  /// Return a [Serializer] for a String representing his [Type]
  ///
  /// Throw an [Exception] if no [Serializer]
  Serializer getByTypeKey(String name) {
    final serializer = _mapperString[name];
    if (serializer == null) {
      throw new Exception("No Serializer found for type key $name");
    }
    return serializer;
  }

  /// Add a [Serializer] to the repository.
  ///
  /// If a [Serializer] using the same type is already in the repository, it
  /// won't be override.
  void add(Serializer serializer) {
    if (!_mapperType.containsKey(serializer.modelType())) {
      _mapperType[serializer.modelType()] = serializer;
    }
    //TODO what if different serializers with same name are added?
    if (!_mapperString.containsKey(serializer.modelString())) {
      _mapperString[serializer.modelString()] = serializer;
    }
  }

  void addAll(Iterable<Serializer> serializers) => serializers.forEach(add);

  /// Convert the given [Object] to a serialized [Object], [Map] or [List]
  ///
  /// If [withType] is set to true, the serialized [Object] will contain a key
  /// ([typeKey]) with the type of the object as a value.
  ///
  /// The [typeKey] can be override using the [typeKey] option.
  dynamic serialize(dynamic object, {bool withType, String typeKey}) {
    return encode(to(object,
        withType: withType ?? _withType ?? false,
        typeKey: typeKey ?? _typeKey));
  }

  /// Deserialize the given [Object] ([Map] or [List]).
  ///
  /// If the [type] option is specified, it will be used to get the correct [Serializer].
  ///
  /// If not, it will look at if the object contain the [typeKey] and will use it
  /// to get the correct [Serializer].
  ///
  /// The [typeKey] can be override using the [typeKey] option.
  dynamic deserialize(dynamic object, {Type type, String typeKey}) {
    typeKey ??= _typeKey;
    final decoded = decode(object);

    return from(decoded, type: type, typeKey: typeKey);
  }

  ///@nodoc
  dynamic encode(dynamic object) => object;

  ///@nodoc
  dynamic decode(dynamic object) => object;

  /// Serializes [object] to Dart built-in type
  dynamic to(dynamic object, {bool withType, String typeKey}) {
    if (object is String || object is num || object is bool || object == null)
      return object;

    typeKey ??= _typeKey;
    withType ??= _withType ?? false;
    final Type type = object.runtimeType;

    if (object is Map) {
      return _transformMapToDart(object, withType, typeKey);
    } else if (object is Iterable) {
      return _transformIterableToDart(object, withType, typeKey);
    } else {
      final Serializer serializer = getByType(type);

      if (serializer == null) {
        throw new Exception("Cannot find serializer for type $type");
      }

      return serializer.serialize(object, withType: withType, typeKey: typeKey);
    }
  }

  Map _transformMapToDart(Map object, bool withType, String typeKey) {
    final mapper = {};
    object.forEach((key, value) {
      final k = to(key, withType: withType, typeKey: typeKey);
      if (value == null) {
        mapper[k] = null;
        return;
      }
      final v = to(value, withType: withType, typeKey: typeKey);
      mapper[k] = v;
    });
    if (withType) mapper[typeKey] = 'Map';
    return mapper;
  }

  List _transformIterableToDart(
          Iterable object, bool withType, String typeKey) =>
      object
          .map((obj) => to(
                obj,
                withType: withType,
                typeKey: typeKey,
              ))
          .toList();

  /// Deserializes Dart built-in object to Dart PODO
  dynamic from(dynamic object, {Type type, String typeKey}) {
    typeKey ??= _typeKey;

    Serializer ser;

    if (type != null) {
      ser = getByType(type);
    }

    return _from(object, ser: ser, typeKey: typeKey);
  }

  dynamic _from(decoded, {Serializer ser, String typeKey}) {
    if (decoded is String ||
        decoded is num ||
        decoded is bool ||
        decoded == null) return decoded;

    if (decoded is Iterable) {
      return decoded
          .map((obj) => _from(obj, ser: ser, typeKey: typeKey))
          .toList();
    } else if (decoded is Map) {
      if (typeKey == null && ser == null) {
        throw new Exception('typeKey or Type is required to decode!');
      }

      if (ser != null) {
        if (typeKey != null) {
          if (decoded.containsKey(typeKey) &&
              ser.modelString() != decoded[typeKey]) {
            return _fromMapWithTypeKey(decoded, typeKey, ser);
          }
        }
        return ser.deserialize(decoded);
      } else {
        if (typeKey == null) {
          throw new Exception(
              'typeKey must be provided if Type is not provided!');
        }

        if (!decoded.containsKey(typeKey)) {
          final map = {};
          decoded.forEach((key, value) {
            final k = _from(key, ser: ser, typeKey: typeKey);
            if (value == null) {
              map[k] = null;
              return;
            }
            final v = _from(value, ser: ser, typeKey: typeKey);
            map[k] = v;
          });
          return map;
        }

        return _fromMapWithTypeKey(decoded, typeKey, ser);
      }
    } else {
      throw new Exception('Unknown type ${decoded.runtimeType}!');
    }
  }

  dynamic _fromMapWithTypeKey(Map decoded, String typeKey, Serializer ser) {
    if (decoded[typeKey] == 'Map') {
      final map = {};
      decoded.forEach((key, value) {
        if (key == typeKey) return;
        final k = _from(key, ser: ser, typeKey: typeKey);
        if (value == null) {
          map[k] = null;
          return;
        }
        final v = _from(value, ser: ser, typeKey: typeKey);
        map[k] = v;
      });
      return map;
    }

    final Serializer serializer = getByTypeKey(decoded[typeKey]);

    if (serializer == null) {
      throw new Exception(
          "Cannot find serializer for typeKey ${decoded[typeKey]}");
    }

    return serializer.deserialize(decoded);
  }
}
