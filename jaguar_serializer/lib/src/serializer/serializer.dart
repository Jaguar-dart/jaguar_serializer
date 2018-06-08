/// Extend this class to create a Serializer for a [Type]
///
/// Example:
///
///     @GenSerializer()
///     class UserSerializer extends Serializer<User> with _$UserSerializer {}
///
/// Both methods, [encodeTo] and [decodeFrom] can handle [Map] or [List].
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

  ////// To implement //////

  /// Decodes model from [Map]
  ModelType fromMap(Map map);

  /// Encodes model to [Map]
  Map<String, dynamic> toMap(ModelType model);
}
