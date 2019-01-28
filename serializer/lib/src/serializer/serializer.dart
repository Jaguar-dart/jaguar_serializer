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
abstract class Serializer<ModelType> {
  const Serializer();

  List<Map> toList(List<ModelType> model) {
    if (model == null) return null;
    return model.map(toMap).toList();
  }

  List<ModelType> fromList(List<Map> model) {
    if (model == null) return null;
    return model.map(fromMap).toList();
  }

  /// Return the [Type] handle by this [Serializer]
  Type modelType() => ModelType;

  /// Clone an object using the serializer
  ModelType clone(ModelType object) => fromMap(toMap(object));

  T getJserDefault<T>(String field) => null;

  ////// To implement //////

  /// Decodes model from [Map]
  ModelType fromMap(Map map);

  /// Encodes model to [Map]
  Map<String, dynamic> toMap(ModelType model);

  List<ModelType> makeList() => List<ModelType>();
}
