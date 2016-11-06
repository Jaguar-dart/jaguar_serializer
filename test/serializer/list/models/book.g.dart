// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.book;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class BookSerializer
// **************************************************************************

abstract class _$BookSerializer implements MapSerializer {
  Book get model;

  Map toMap() {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["tags"] =
        model.tags?.map((String val) => val != null ? val : null)?.toList();
    ret["publishedDates"] =
        new MapMaker(model.publishedDates, (num key) => key, (String value) {
      return value;
    }).model;
    ret["authors"] = model.authors
        ?.map((Author val) =>
            val != null ? new AuthorSerializer(val).toMap() : null)
        ?.toList();
    return ret;
  }

  Book fromMap(Map map) {
    if (map is! Map) {
      return null;
    }
    model.name = map["name"];
    model.tags =
        (map["tags"] as List<String>)?.map((String val) => val)?.toList();
    model.publishedDates = new MapMaker(
        map["publishedDates"] as Map<num, String>, (num key) => key,
        (String value) {
      return value;
    }).model;
    model.authors = (map["authors"] as List<Map>)
        ?.map((Map val) => new AuthorSerializer().fromMap(val))
        ?.toList();
    return model;
  }
}
