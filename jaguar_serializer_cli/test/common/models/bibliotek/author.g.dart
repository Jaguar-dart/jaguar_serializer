// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$AuthorSerializer implements Serializer<Author> {
  @override
  Map<String, dynamic> toMap(Author model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Author fromMap(Map<String, dynamic> map, {Author model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Author();
    obj.name = map['name'] as String;
    return obj;
  }

  @override
  String modelString() => 'Author';
}
