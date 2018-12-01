import '../serializer/serializer.dart';

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
abstract class SerializerRepo {
  final Map<Type, Serializer> _mapperType = {};

  Iterable<Serializer> get serializers => _mapperType.values;

  /// Return a [Serializer] for a Type
  Serializer getByType<T>(Type type) => _mapperType[type];

  /// Add a [Serializer] to the repository.
  ///
  /// If a [Serializer] using the same type is already in the repository, it
  /// won't be override.
  void add(Serializer serializer) {
    if (!_mapperType.containsKey(serializer.type)) {
      _mapperType[serializer.type] = serializer;
    }
  }

  void addAll(Iterable<Serializer> serializers) => serializers.forEach(add);

  /// Deserializes Dart built-in object to Dart PODO
  dynamic from<T>(dynamic object);

  /// Serializes [object] to Dart built-in type
  dynamic to(dynamic object);
}
