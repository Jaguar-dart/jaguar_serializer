// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer extends JsonSerializer<Map<String, dynamic>, Player> {
  static Serializer<Map<String, dynamic>, Address> __addressSerializer;
  static Serializer<Map<String, dynamic>, Address> get _addressSerializer =>
      __addressSerializer ??= new AddressSerializer();

  _$PlayerSerializer(): super(_toMap, _fromMap);

  static Map<String, dynamic> _toMap(Player model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'email', model.email);
    setMapValue(ret, 'score', model.score);
    setMapValue(
        ret,
        'address',
        codeIterable(
            model.address, (val) => _addressSerializer.encode(val as Address)));
    return ret;
  }

  static Player _fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    final obj = new Player();
    obj.name = map['name'] as String;
    obj.email = map['email'] as String;
    obj.score = map['score'] as int;
    obj.address = codeIterable<Address>(map['address'] as Iterable,
            (val) => _addressSerializer.decode(val as Map<String, dynamic>));
    return obj;
  }

}

abstract class _$AddressSerializer extends JsonSerializer<Map<String, dynamic>, Address> {
  _$AddressSerializer() : super((model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'street', model.street);
    setMapValue(ret, 'city', model.city);
    return ret;
  }, (map) {
    if (map == null) return null;
    final obj = new Address();
    obj.street = map['street'] as String;
    obj.city = map['city'] as String;
    return obj;
  });

}
