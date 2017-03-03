// GENERATED CODE - DO NOT MODIFY BY HAND

part of test.common.models.address_book;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class Person
// **************************************************************************

abstract class _$Person implements Serializer<Person> {
  final Address toAddress = new Address();
  final Address fromAddress = new Address();

  Map toMap(Person model, {bool withTypeInfo: false, String typeInfoKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.address != null) {
        ret["address"] = toAddress.toMap(model.address,
            withTypeInfo: withTypeInfo, typeInfoKey: typeInfoKey);
      }
      if (modelString() != null && withTypeInfo) {
        ret[typeInfoKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Person fromMap(Map map, {Person model, String typeInfoKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Person) {
      model = createModel();
    }
    model.name = map["name"];
    model.address =
        fromAddress.fromMap(map["address"], typeInfoKey: typeInfoKey);
    return model;
  }

  String modelString() => "Person";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class Address
// **************************************************************************

abstract class _$Address implements Serializer<Address> {
  Map toMap(Address model, {bool withTypeInfo: false, String typeInfoKey}) {
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
      if (modelString() != null && withTypeInfo) {
        ret[typeInfoKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Address fromMap(Map map, {Address model, String typeInfoKey}) {
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

  String modelString() => "Address";
}
