import 'dart:convert';

/// Extend this class to create a Serializer for a [Type]
///
/// Example:
///
///     class User {
///       String name;
///       int age;
///     }
///
///     @GenSerializer()
///     class UserSerializer extends Serializer<User> with _$UserSerializer {}
///
typedef ToType SerializerFactory<ToType, FromType>(FromType params);

abstract class Serializer<FromType, ToType> {
  final SerializerFactory<FromType, ToType> _encodeFactory;
  final SerializerFactory<ToType, FromType> _decodeFactory;

  Serializer(this._encodeFactory, this._decodeFactory);

  Type get type => ToType;

  FromType encode(ToType data) => _encodeFactory(data);

  ToType decode(FromType data) => _decodeFactory(data);

  /// Clone an object using the serializer
  FromType clone(ToType object) => decode(encode(object)) as FromType;

  T getJserDefault<T>(String field) => null;
}

abstract class JsonSerializer<FromType, ToType> extends Serializer<FromType, ToType> {
  JsonSerializer(SerializerFactory<FromType, ToType> to, SerializerFactory<ToType, FromType> from) : super(to, from);

  String toJson(ToType data) => json.encode(_encodeFactory(data));

  ToType fromJson(String data) => _decodeFactory(json.decode(data) as FromType);
}
