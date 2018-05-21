// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_book.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$Person implements Serializer<Person> {
  final _address = new Address();

  @override
  Map<String, dynamic> toMap(Person model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'address',
          _address.toMap(model.address, withType: withType, typeKey: typeKey));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Person fromMap(Map<String, dynamic> map, {Person model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Person();
    obj.name = map['name'] as String;
    obj.address = _address.fromMap(map['address'] as Map<String, dynamic>);
    return obj;
  }

  @override
  String modelString() => 'Person';
}

abstract class _$Address implements Serializer<Address> {
  @override
  Map<String, dynamic> toMap(Address model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'street', model.street);
      setNullableValue(ret, 'houseNum', model.houseNum);
      setNullableValue(ret, 'city', model.city);
      setNullableValue(ret, 'country', model.country);
      setNullableValue(ret, 'pincode', model.pincode);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Address fromMap(Map<String, dynamic> map, {Address model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Address();
    obj.street = map['street'] as String;
    obj.houseNum = map['houseNum'] as String;
    obj.city = map['city'] as String;
    obj.country = map['country'] as String;
    obj.pincode = map['pincode'] as String;
    return obj;
  }

  @override
  String modelString() => 'Address';
}
