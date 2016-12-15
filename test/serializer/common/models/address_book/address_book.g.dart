// GENERATED CODE - DO NOT MODIFY BY HAND

part of test.common.models.address_book;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class Person
// **************************************************************************

abstract class _$Person implements MapSerializer<Person> {
  Map toMap(Person model) {
    Map ret = new Map();
    ret["name"] = model.name;
    ret["address"] = new Address().toMap(model.address);
    return ret;
  }

  Person fromMap(Map map, {Person model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Person) {
      model = createModel();
    }
    model.name = map["name"];
    model.address = new Address().fromMap(map["address"]);
    return model;
  }
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class Address
// **************************************************************************

abstract class _$Address implements MapSerializer<Address> {
  Map toMap(Address model) {
    Map ret = new Map();
    ret["street"] = model.street;
    ret["houseNum"] = model.houseNum;
    ret["city"] = model.city;
    ret["country"] = model.country;
    ret["pincode"] = model.pincode;
    return ret;
  }

  Address fromMap(Map map, {Address model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Address) {
      model = createModel();
    }
    model.street = map["street"];
    model.houseNum = map["houseNum"];
    model.city = map["city"];
    model.country = map["country"];
    model.pincode = map["pincode"];
    return model;
  }
}
