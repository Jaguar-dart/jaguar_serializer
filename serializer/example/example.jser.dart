// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  Serializer<Address> __addressSerializer;
  Serializer<Address> get _addressSerializer =>
      __addressSerializer ??= new AddressSerializer();
  @override
  Map<String, dynamic> toMap(Player model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'score', model.score);
    setMapValue(
        ret,
        'address',
        codeIterable(
            model.address, (val) => _addressSerializer.toMap(val as Address)));
    return ret;
  }

  @override
  Player fromMap(Map map) {
    if (map == null) return null;
    final obj = new Player();
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.score = map['score'] as int;
    obj.address = codeIterable<Address>(map['address'] as Iterable,
        (val) => _addressSerializer.fromMap(val as Map));
    return obj;
  }
}

abstract class _$AddressSerializer implements Serializer<Address> {
  @override
  Map<String, dynamic> toMap(Address model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'street', model.street);
    setMapValue(ret, 'city', model.city);
    return ret;
  }

  @override
  Address fromMap(Map map) {
    if (map == null) return null;
    final obj = new Address();
    obj.street = map['street'] as String;
    obj.city = map['city'] as String;
    return obj;
  }
}
