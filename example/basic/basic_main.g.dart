// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.player;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerSerializer
// **************************************************************************

abstract class _$PlayerSerializer implements Serializer<Player> {
  final AddressSerializer toAddressSerializer = new AddressSerializer();
  final AddressSerializer fromAddressSerializer = new AddressSerializer();

  Map toMap(Player model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.email != null) {
        ret["email"] = model.email;
      }
      if (model.age != null) {
        ret["age"] = model.age;
      }
      if (model.score != null) {
        ret["score"] = model.score;
      }
      if (model.emailConfirmed != null) {
        ret["emailConfirmed"] = model.emailConfirmed;
      }
      if (model.test != null) {
        ret["test"] = model.test;
      }
      if (model.address != null) {
        ret["address"] = toAddressSerializer.toMap(model.address,
            withType: withType, typeKey: typeKey);
      }
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
    model.name = map["name"] ?? model.name;
    model.email = map["email"] ?? model.email;
    model.age = map["age"] ?? model.age;
    model.score = map["score"] ?? model.score;
    model.emailConfirmed = map["emailConfirmed"] ?? model.emailConfirmed;
    model.test = map["test"] ?? model.test;
    model.address =
        fromAddressSerializer.fromMap(map["address"], typeKey: typeKey) ??
            model.address;
    return model;
  }

  String modelString() => "Player";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class AddressSerializer
// **************************************************************************

abstract class _$AddressSerializer implements Serializer<Address> {
  Map toMap(Address model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.street != null) {
        ret["street"] = model.street;
      }
      if (model.zipcode != null) {
        ret["zipcode"] = model.zipcode;
      }
      if (model.country != null) {
        ret["country"] = model.country;
      }
      if (model.city != null) {
        ret["city"] = model.city;
      }
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
    model.street = map["street"] ?? model.street;
    model.zipcode = map["zipcode"] ?? model.zipcode;
    model.country = map["country"] ?? model.country;
    model.city = map["city"] ?? model.city;
    return model;
  }

  String modelString() => "Address";
}
