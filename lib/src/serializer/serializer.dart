library jaguar_serializer.serializer;

import 'package:jaguar_serializer/src/annotations/annotations.dart';

part 'custom_codec.dart';
part 'map_maker.dart';
part 'repo.dart';

/// Extend this class to create a Serializer for a [Type]
///
/// Example:
///
///     @GenSerializer()
///     class UserSerializer extends Serializer<User> with _$UserSerializer {
///        User createModel() => new User();
///     }
///
/// Both methods, [to] and [from] can handle [Map] or [List].
abstract class Serializer<ModelType> {
  /// Convert [model] to a serialized object.
  ///
  /// If [withType] is set to true, the serialized [Object] will contain a key.
  ///
  /// The value of the key can be set with the [typeKey] option.
  ///
  /// It will be associated with the type of the object.
  dynamic serialize(dynamic model,
      {bool withType: false, String typeKey: defaultTypeInfoKey}) {
    if (model is ModelType) {
      return toMap(model, withType: withType, typeKey: typeKey);
    } else if (model is List<ModelType>) {
      return model
          .map((ModelType model) =>
              toMap(model, withType: withType, typeKey: typeKey))
          .toList();
    } else if (model == null) {
      return null;
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  /// Deserialize [object]
  ///
  /// An instance of the resulting object can be passed with the [model] option.
  dynamic deserialize(dynamic object, {ModelType model}) {
    if (object is Map) {
      return fromMap(object, model: model);
    } else if (object is List<Map>) {
      return object.map((Map map) => fromMap(map)).toList();
    } else if (object == null) {
      return null;
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  /// Encodes model to [Map]
  Map toMap(ModelType model, {bool withType: false, String typeKey});

  /// Decodes model from [Map]
  ModelType fromMap(Map map, {ModelType model}) {
    if (model is! ModelType) {
      model = createModel();
    }
    return model;
  }

  /// Return the [Type] handle by this [Serializer]
  Type modelType() => ModelType;

  /// Return the associated [String] of the [Type] handle by this [Serializer], used by [typeKey]
  String modelString() => null;

  ModelType createModel();
}
