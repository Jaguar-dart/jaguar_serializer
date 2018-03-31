// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.models.player;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$InnerModel1Serializer implements Serializer<InnerModel1> {
  Map<String, dynamic> toMap(InnerModel1 model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "number", model.number);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  InnerModel1 fromMap(Map<String, dynamic> map,
      {InnerModel1 model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! InnerModel1) {
      model = new InnerModel1();
    }
    model.number = map["number"] as int;
    return model;
  }

  String modelString() => "InnerModel1";
}

abstract class _$InnerModel2Serializer implements Serializer<InnerModel2> {
  Map<String, dynamic> toMap(InnerModel2 model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "name", model.name);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  InnerModel2 fromMap(Map<String, dynamic> map,
      {InnerModel2 model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! InnerModel2) {
      model = new InnerModel2();
    }
    model.name = map["name"] as String;
    return model;
  }

  String modelString() => "InnerModel2";
}

abstract class _$OuterModelSerializer implements Serializer<OuterModel> {
  final _innerModel1Serializer = new InnerModel1Serializer();
  final _innerModel2Serializer = new InnerModel2Serializer();

  Map<String, dynamic> toMap(OuterModel model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "id", model.id);
      setNullableValue(
          ret,
          "list",
          nullableIterableMapper(
              model.list,
              (val) => _innerModel1Serializer.toMap(val as InnerModel1,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret,
          "map",
          nullableMapMaker(
              model.map,
              (val) => _innerModel2Serializer.toMap(val as InnerModel2,
                  withType: withType, typeKey: typeKey)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  OuterModel fromMap(Map<String, dynamic> map,
      {OuterModel model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! OuterModel) {
      model = new OuterModel();
    }
    model.id = map["id"] as String;
    model.list = nullableIterableMapper<InnerModel1>(
        map["list"] as Iterable,
        (val) => _innerModel1Serializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.map = nullableMapMaker<InnerModel2>(
        map["map"] as Map<String, dynamic>,
        (val) => _innerModel2Serializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    return model;
  }

  String modelString() => "OuterModel";
}
