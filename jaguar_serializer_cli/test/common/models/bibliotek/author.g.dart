// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.Author;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$AuthorSerializer implements Serializer<Author> {
  Map<String, dynamic> toMap(Author model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Author fromMap(Map<String, dynamic> map, {Author model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Author) {
      model = new Author();
    }
    model.name = map["name"] as String;
    return model;
  }

  String modelString() => "Author";
}
