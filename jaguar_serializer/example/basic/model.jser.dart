// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  final _addressSerializer = new AddressSerializer();

  @override
  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'email', model.email);
      setNullableValue(ret, 'age', model.age);
      setNullableValue(ret, 'score', model.score);
      setNullableValue(ret, 'email_confirmed', model.emailConfirmed);
      setNullableValue(ret, 'test', model.test);
      setNullableValue(
          ret,
          'address',
          nullableIterableMapper(model.address,
              (val) => _addressSerializer.toMap(val as Address)));
    }
    return ret;
  }

  @override
  Player fromMap(Map map, {Player model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Player();
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.age = map['age'] as int;
    obj.score = map['score'] as int;
    obj.emailConfirmed = map['email_confirmed'] as bool;
    obj.test = map['test'] as int;
    obj.address = nullableIterableMapper<Address>(map['address'] as Iterable,
        (val) => _addressSerializer.fromMap(val as Map<String, dynamic>));
    return obj;
  }
}

abstract class _$AddressSerializer implements Serializer<Address> {
  @override
  Map<String, dynamic> toMap(Address model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'street', model.street);
      setNullableValue(ret, 'zipcode', model.zipcode);
      setNullableValue(ret, 'country', model.country);
      setNullableValue(ret, 'city', model.city);
    }
    return ret;
  }

  @override
  Address fromMap(Map map, {Address model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Address();
    obj.street = map['street'] as String;
    obj.zipcode = map['zipcode'] as String;
    obj.country = map['country'] as String;
    obj.city = map['city'] as String;
    return obj;
  }
}
