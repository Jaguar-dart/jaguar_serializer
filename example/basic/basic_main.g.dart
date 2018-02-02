// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.player;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  final _addressSerializer = new AddressSerializer();

  Map toMap(Player model, {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNonNullableValue(ret, "name", model.name);
      setNonNullableValue(ret, "email", model.email);
      setNonNullableValue(ret, "age", model.age);
      setNonNullableValue(ret, "score", model.score);
      setNonNullableValue(ret, "emailConfirmed", model.emailConfirmed);
      setNonNullableValue(ret, "test", model.test);
      setNonNullableValue(
          ret,
          "address",
          _addressSerializer.toMap(model.address,
              withType: withType, typeKey: typeKey));
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Player fromMap(Map map, {Player model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Player) {
      model = createModel();
    }
    model.name = map["name"];
    model.email = map["email"];
    model.age = map["age"];
    model.score = map["score"];
    model.emailConfirmed = map["emailConfirmed"];
    model.test = map["test"];
    model.address =
        _addressSerializer.fromMap(map["address"], typeKey: typeKey);
    return model;
  }

  String modelString() => "Player";
}

abstract class _$AddressSerializer implements Serializer<Address> {
  Map toMap(Address model, {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNonNullableValue(ret, "street", model.street);
      setNonNullableValue(ret, "zipcode", model.zipcode);
      setNonNullableValue(ret, "country", model.country);
      setNonNullableValue(ret, "city", model.city);
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  Address fromMap(Map map, {Address model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Address) {
      model = createModel();
    }
    model.street = map["street"];
    model.zipcode = map["zipcode"];
    model.country = map["country"];
    model.city = map["city"];
    return model;
  }

  String modelString() => "Address";
}
