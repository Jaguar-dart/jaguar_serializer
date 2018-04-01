// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.book;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$BookSerializer implements Serializer<Book> {
  final _uriProcessor = const UriProcessor();
  final _dateTimeProcessor = const DateTimeProcessor();
  final _authorSerializer = new AuthorSerializer();

  Map<String, dynamic> toMap(Book model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "tags",
          nullableIterableMapper(model.tags, (val) => val as String));
      setNullableValue(
          ret,
          "publishedDates",
          nullableMapMaker(model.publishedDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime)));
      setNullableValue(
          ret,
          "authors",
          nullableIterableMapper(
              model.authors,
              (val) => _authorSerializer.toMap(val as Author,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret,
          "websites",
          nullableIterableMapper(
              model.websites, (val) => _uriProcessor.serialize(val as Uri)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Book fromMap(Map<String, dynamic> map, {Book model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Book) {
      model = new Book();
    }
    model.name = map["name"] as String;
    model.tags = nullableIterableMapper<String>(
        map["tags"] as Iterable, (val) => val as String);
    model.publishedDates = nullableMapMaker<DateTime>(
        map["publishedDates"] as Map<String, dynamic>,
        (val) => _dateTimeProcessor.deserialize(val as String));
    model.authors = nullableIterableMapper<Author>(
        map["authors"] as Iterable,
        (val) => _authorSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.websites = nullableIterableMapper<Uri>(map["websites"] as Iterable,
        (val) => _uriProcessor.deserialize(val as String));
    return model;
  }

  String modelString() => "Book";
}
