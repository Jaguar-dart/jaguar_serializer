// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.exclude_by_default;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class ExcludeByDefaultCodec
// **************************************************************************

abstract class _$ExcludeByDefaultCodec implements Serializer<ExcludeByDefault> {
  Map toMap(ExcludeByDefault model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = model.id;
      }
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  ExcludeByDefault fromMap(Map map, {ExcludeByDefault model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! ExcludeByDefault) {
      model = createModel();
    }
    model.id = map["id"] ?? model.id;
    model.name = map["name"] ?? model.name;
    return model;
  }

  String modelString() => "ExcludeByDefault";
}
