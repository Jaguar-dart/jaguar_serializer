// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.player;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  final _addressSerializer = new AddressSerializer();

  Map<String, dynamic> toMap(Player model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setNullableValue(ret, "email", model.email);
      setNullableValue(ret, "age", model.age);
      setNullableValue(ret, "score", model.score);
      setNullableValue(ret, "email_confirmed", model.emailConfirmed);
      setNullableValue(ret, "test", model.test);
      setNullableValue(
          ret,
          "address",
          nullableIterableMapper(
              model.address,
              (val) => _addressSerializer.toMap(val as Address,
                  withType: withType, typeKey: typeKey)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Player fromMap(Map<String, dynamic> map, {Player model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Player) {
      model = new Player();
    }
    model.name = map["name"] as String;
    model.email = map["email"] as String;
    model.age = map["age"] as int;
    model.score = map["score"] as int;
    model.emailConfirmed = map["email_confirmed"] as bool;
    model.test = map["test"] as int;
    model.address = nullableIterableMapper<Address>(
        map["address"] as Iterable,
        (val) => _addressSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    return model;
  }

  String modelString() => "Player";
}

abstract class _$AddressSerializer implements Serializer<Address> {
  Map<String, dynamic> toMap(Address model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "street", model.street);
      setNullableValue(ret, "zipcode", model.zipcode);
      setNullableValue(ret, "country", model.country);
      setNullableValue(ret, "city", model.city);
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
    model.zipcode = map["zipcode"] as String;
    model.country = map["country"] as String;
    model.city = map["city"] as String;
    return model;
  }

  String modelString() => "Address";
}
