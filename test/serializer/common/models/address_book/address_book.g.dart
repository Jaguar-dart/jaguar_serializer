// GENERATED CODE - DO NOT MODIFY BY HAND

part of test.common.models.address_book;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class Person
// **************************************************************************

abstract class _$Person implements MapSerializer<Person> {
  Map toMap(Person model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.address != null) {
        ret["address"] = JaguarSerializer
            .getMapSerializerForType(Address)
            .toMap(model.address, withTypeInfo: withTypeInfo);
      }
      if (modelString != null && withTypeInfo) {
        ret["@t"] = modelString;
      }
    }
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
    model.address = JaguarSerializer
        .getMapSerializerForType(Address)
        .fromMap(map["address"]);
    return model;
  }

  String get modelString => "Person";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class Address
// **************************************************************************

abstract class _$Address implements MapSerializer<Address> {
  Map toMap(Address model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.street != null) {
        ret["street"] = model.street;
      }
      if (model.houseNum != null) {
        ret["houseNum"] = model.houseNum;
      }
      if (model.city != null) {
        ret["city"] = model.city;
      }
      if (model.country != null) {
        ret["country"] = model.country;
      }
      if (model.pincode != null) {
        ret["pincode"] = model.pincode;
      }
      if (modelString != null && withTypeInfo) {
        ret["@t"] = modelString;
      }
    }
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

  String get modelString => "Address";
}
