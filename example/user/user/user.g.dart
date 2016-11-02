// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.model.user;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserViewSerializer
// **************************************************************************

abstract class _$UserViewSerializer {
  User get model;
  Map toMap() {
    Map ret = new Map();
    ret["id"] = model.id;
    ret["email"] = model.email;
    ret["name"] = model.name;
    ret["book"] = model.book;
    ret["books"] = model.books;

    ret["listOfList"] = model.listOfList
        .map((List<String> value1) => value1.map((value2) => value2).toList())
        .toList();

    {
      Map<String, Map<String, String>> value = {};
      for (String key in model.mapOfMap.keys) {
        Map<String, String> value1 = {};
        for(String key1 in model.mapOfMap[key].keys) {
          value1[key1] = model.mapOfMap[key][key1];
        }
        value[key] = value1;
      }
      ret["mapOfMap"] = value;
    }

    {
      ret["mixed1"] = model.mixed1.map((Map<String, List<Map<String, String>>> value1) {
        {
          Map<String, List<Map<String, String>>> value2 = {};
          for (String key2 in value1.keys) {
            value2[key2] = value1[key2].map((Map<String, String> value3) {
              Map<String, String> value4 = {};

              for(String key4 in value3.keys) {
                value4[key4] = value3[key4];
              }

              return value4;
            }).toList();
          }
          return value2;
        }
      }).toList();
    }

    return ret;
  }

  void fromMap(Map map) {
    if (map is! Map) {
      return;
    }
    model.id = map["id"];
    model.email = map["email"];
    model.name = map["name"];
    model.book = map["book"];
    model.books = map["books"];
    model.tags = map["tags"];
  }
}
