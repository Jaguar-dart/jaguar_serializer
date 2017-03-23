library jaguar_serializer.serializer;

part 'custom_codec.dart';
part 'map_maker.dart';
part 'repo.dart';

/**
 * Extend this class to create a Serializer for a [Type]
 *
 * Example:
 *
 *     @GenSerializer()
 *     class UserSerializer extends Serializer<User> with _$UserSerializer {
 *        User createModel() => new User();
 *     }
 *
 * Both methods, [to] and [from] can handle [Map] or [List].
 */
abstract class Serializer<ModelType> {
  /**
   * Convert [model] to a serialized object.
   *
   * If [withTypeInfo] is set to true, the serialized [Object] will contain a key.
   *
   * The value of the key can be set with the [typeInfoKey] option.
   *
   * It will be associated with the type of the object.
   */
  dynamic serialize(dynamic model,
      {bool withTypeInfo: false, String typeInfoKey: defaultTypeInfoKey}) {
    if (model is ModelType) {
      return toMap(model, withTypeInfo: withTypeInfo, typeInfoKey: typeInfoKey);
    } else if (model is List<ModelType>) {
      return model
          .map((ModelType model) => toMap(model,
              withTypeInfo: withTypeInfo, typeInfoKey: typeInfoKey))
          .toList();
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  /**
   * Deserialize [object]
   *
   * An instance of the resulting object can be passed with the [model] option.
   */
  dynamic deserialize(dynamic object, {ModelType model}) {
    if (object is Map) {
      return fromMap(object, model: model);
    } else if (object is List<Map>) {
      return object.map((Map map) => fromMap(map, model: model)).toList();
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  /// Encodes model to [Map]
  Map toMap(ModelType model, {bool withTypeInfo: false, String typeInfoKey});

  /// Decodes model from [Map]
  ModelType fromMap(Map map, {ModelType model}) {
    if (model is! ModelType) {
      model = createModel();
    }
    return model;
  }

  /// Return the [Type] handle by this [Serializer]
  Type modelType() => ModelType;

  /// Return the associated [String] of the [Type] handle by this [Serializer], used by [typeInfoKey]
  String modelString();

  ModelType createModel();
}
