library serializer.map_serializer;

import 'dart:convert';

part 'field_annotations.dart';
part 'custom_codec.dart';

/// Map serializer interface
abstract class MapSerializer<ModelType> {
  /// Encodes model to [Map]
  Map toMap(ModelType model);

  /// Decodes model from [Map]
  ModelType fromMap(Map map, {ModelType model}) {
    if (model is! ModelType) {
      model = createModel();
    }

    return model;
  }

  ModelType createModel();
}

abstract class Jsonable<ModelType> {
  String toJson(ModelType model);

  ModelType fromJson(String json, {ModelType model}) {
    if (model is! ModelType) {
      model = createModel();
    }

    return model;
  }

  ModelType createModel();
}

/// Mixin that provides encoding and decoding JSON on top of [MapSerializer]
abstract class JsonMixin<ModelType>
    implements MapSerializer<ModelType>, Jsonable<ModelType> {
  String toJson(ModelType model) => JSON.encode(toMap(model));

  ModelType fromJson(String json, {ModelType model}) =>
      fromMap(JSON.decode(json), model: model);
}

/// Annotation used to request generation of serializer
class GenSerializer {
  const GenSerializer();
}

/// Annotation used to provide serializers for specific types
class ProvideSerializers {
  /// A mapping from Type to the serializer used for that Type
  final Map<Type, Type> serializers;

  const ProvideSerializers(this.serializers);
}

class MapMaker<KF, VF, KT, VT> {
  Map<KT, VT> _model;

  MapMaker(Map<KF, VF> map, [KT keyMapper(KF from), VT valueMapper(VF from)]) {
    if (map is Map) {
      _model = new Map<KT, VT>();
      map.forEach((KF key, VF value) {
        _model[keyMapper(key)] = valueMapper(value);
      });
    }
  }

  Map<KT, VT> get model => _model;
}
