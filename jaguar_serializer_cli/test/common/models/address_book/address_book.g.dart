// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_book.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$Person implements Serializer<Person> {
  final _address = new Address();

  Map<String, dynamic> toMap(Person model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "address",
          _address.toMap(model.address, withType: withType, typeKey: typeKey));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Person fromMap(Map<String, dynamic> map, {Person model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Person) {
      model = new Person();
    }
    model.name = map["name"] as String;
    model.address = _address.fromMap(map["address"] as Map<String, dynamic>,
        typeKey: typeKey);
    return model;
  }

  String modelString() => "Person";
}

abstract class _$Address implements Serializer<Address> {
  Map<String, dynamic> toMap(Address model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "street", model.street);
      setNullableValue(ret, "houseNum", model.houseNum);
      setNullableValue(ret, "city", model.city);
      setNullableValue(ret, "country", model.country);
      setNullableValue(ret, "pincode", model.pincode);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Address fromMap(Map<String, dynamic> map, {Address model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Address) {
      model = new Address();
    }
    model.street = map["street"] as String;
    model.houseNum = map["houseNum"] as String;
    model.city = map["city"] as String;
    model.country = map["country"] as String;
    model.pincode = map["pincode"] as String;
    return model;
  }

  String modelString() => "Address";
}
