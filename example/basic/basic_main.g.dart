// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.player;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class PlayerSerializer
// **************************************************************************

abstract class _$PlayerSerializer implements MapSerializer<Player> {
  final AddressSerializer toAddressSerializer = new AddressSerializer();
  final AddressSerializer fromAddressSerializer = new AddressSerializer();

  Map toMap(Player model, {bool withTypeInfo: false}) {
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
            withTypeInfo: withTypeInfo);
      }
      if (modelString != null && withTypeInfo) {
        ret["@t"] = modelString;
      }
    }
    return ret;
  }

  Player fromMap(Map map, {Player model}) {
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
    model.address = fromAddressSerializer.fromMap(map["address"]);
    return model;
  }

  String get modelString => "Player";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class AddressSerializer
// **************************************************************************

abstract class _$AddressSerializer implements MapSerializer<Address> {
  Map toMap(Address model, {bool withTypeInfo: false}) {
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
    model.zipcode = map["zipcode"];
    model.country = map["country"];
    model.city = map["city"];
    return model;
  }

  String get modelString => "Address";
}
