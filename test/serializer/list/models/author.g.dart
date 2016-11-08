// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.Author;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class AuthorSerializer
// **************************************************************************

abstract class _$AuthorSerializer implements MapSerializer {
  Author get model;

  Map toMap() {
    Map ret = new Map();
    ret["name"] = model.name;
    return ret;
  }

  Author fromMap(Map map) {
    if (map is! Map) {
      return null;
    }
    model.name = map["name"];
    return model;
  }
}
