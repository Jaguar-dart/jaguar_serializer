// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserViewSerializer
// **************************************************************************

abstract class _$UserViewSerializer implements MapSerializer {
  User get model;

  Map toMap() {
    Map ret = new Map();
    ret["Id"] = model.id;
    ret["Email"] = model.email;
    ret["N"] = model.name;
    ret["DoB"] = new DateTimeSerializer(#dob).to(model.dob);
    ret["Book"] = new BookViewSerializer(model.book).toMap();
    return ret;
  }

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }
    model.id = map["Id"];
    model.email = map["Email"];
    model.name = map["N"];
    model.dob = new DateTimeSerializer(#dob).from(map["DoB"]);
    model.book =
        (new BookViewSerializer(new Book())..fromMap(map["Book"])).model;
  }
}
