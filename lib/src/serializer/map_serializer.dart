part of jaguar_serializer.serializer;

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
}
