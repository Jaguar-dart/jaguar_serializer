library jaguar_serializer.serializer;

part 'custom_codec.dart';
part 'map_maker.dart';
part 'repo.dart';

abstract class Serializer<ModelType> {
  dynamic to(dynamic model,
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

  dynamic from(dynamic object, {Type type, String useTypeInfoKey}) {
    if (object is Map) {
      return fromMap(object, typeInfoKey: useTypeInfoKey);
    } else if (object is List<Map>) {
      return object
          .map((Map map) => fromMap(map, typeInfoKey: useTypeInfoKey))
          .toList();
    } else {
      throw new Exception("Unknown object type received!");
    }
  }

  /// Encodes model to [Map]
  Map toMap(ModelType model, {bool withTypeInfo: false, String typeInfoKey});

  /// Decodes model from [Map]
  ModelType fromMap(Map map, {ModelType model, String typeInfoKey}) {
    if (model is! ModelType) {
      model = createModel();
    }

    return model;
  }

  Type get modelType => ModelType;

  String get modelString => "$ModelType";

  ModelType createModel();
}
