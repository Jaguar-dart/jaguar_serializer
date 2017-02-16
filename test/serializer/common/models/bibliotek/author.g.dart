// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.Author;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class AuthorSerializer
// **************************************************************************

abstract class _$AuthorSerializer implements MapSerializer<Author> {
  Map toMap(Author model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (modelString != null && withTypeInfo) {
        ret[JaguarSerializer.type_info_key] = modelString;
      }
    }
    return ret;
  }

  Author fromMap(Map map, {Author model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Author) {
      model = createModel();
    }
    model.name = map["name"];
    return model;
  }

  String get modelString => "Author";
}
