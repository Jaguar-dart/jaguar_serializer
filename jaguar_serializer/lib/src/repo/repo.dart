import '../serializer/serializer.dart';

part 'impl.dart';

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
  factory SerializerRepo({List<Serializer> serializers}) =>
      new SerializerRepoImpl(serializers: serializers);

  Iterable<Serializer> get serializers;

  /// Return a [Serializer] for a Type
  Serializer<T> getByType<T>(Type type);

  /// Add a [Serializer] to the repository.
  ///
  /// If a [Serializer] using the same type is already in the repository, it
  /// won't be override.
  void add(Serializer serializer);

  void addAll(Iterable<Serializer> serializers) => serializers.forEach(add);

  /// Deserializes [object] to [T]
  T oneFrom<T>(dynamic object);

  /// Deserializes [object] ([List<dynamic>]) to [List<T>]
  List<T> listFrom<T>(List object);

  Map<String, T> mapFrom<T>(Map<String, dynamic> object);

  /// Deserializes Dart built-in object to Dart PODO
  dynamic from<T>(dynamic object);

  /// Serializes [object] to Dart built-in type
  dynamic to(dynamic object);
}
