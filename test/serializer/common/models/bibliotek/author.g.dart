// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.Author;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class AuthorSerializer
// **************************************************************************

abstract class _$AuthorSerializer implements Serializer<Author> {
  Map toMap(Author model, {bool withTypeInfo: false, String typeInfoKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (modelString() != null && withTypeInfo) {
        ret[typeInfoKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Author fromMap(Map map, {Author model, String typeInfoKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Author) {
      model = createModel();
    }
    model.name = map["name"];
    return model;
  }

  String modelString() => "Author";
}
