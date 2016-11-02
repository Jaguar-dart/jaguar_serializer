library serializer.map_serializer;

import 'dart:convert';

part 'field_annotations.dart';
part 'custom_codec.dart';

/// Map serializer interface
abstract class MapSerializer<ModelType> {
  MapSerializer(ModelType model);

  /// Creates serializer from [Map]
  MapSerializer.FromMap(Map map);

  /// Encodes model to [Map]
  Map toMap();

  /// Decodes model from [Map]
  void fromMap(Map map);

  /// Returns the stored model
  ModelType get model;
}

/// Mixin that provides encoding and decoding JSON on top of [MapSerializer]
abstract class JsonMixin implements MapSerializer {
  String toJson() => JSON.encode(toMap());

  void fromJson(String json) {
    Map map = JSON.decode(json);
    fromMap(map);
  }
}

/// Annotation used to request generation of serializer
class GenSerializer {
  const GenSerializer();
}

/// Annotation used to provide serializers for specific types
class ProvideSerializers {
  /// A mapping from Type to the serializer used for that Type
  final Map<Type, MapSerializer> serializers;

  const ProvideSerializers(this.serializers);
}
