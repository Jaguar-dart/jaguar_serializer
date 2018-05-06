// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$InnerModel1Serializer implements Serializer<InnerModel1> {
  @override
  Map<String, dynamic> toMap(InnerModel1 model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'number', model.number);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  InnerModel1 fromMap(Map<String, dynamic> map, {InnerModel1 model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new InnerModel1();
    obj.number = map['number'] as int;
    return obj;
  }

  @override
  String modelString() => 'InnerModel1';
}

abstract class _$InnerModel2Serializer implements Serializer<InnerModel2> {
  @override
  Map<String, dynamic> toMap(InnerModel2 model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  InnerModel2 fromMap(Map<String, dynamic> map, {InnerModel2 model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new InnerModel2();
    obj.name = map['name'] as String;
    return obj;
  }

  @override
  String modelString() => 'InnerModel2';
}

abstract class _$OuterModelSerializer implements Serializer<OuterModel> {
  final _innerModel1Serializer = new InnerModel1Serializer();
  final _innerModel2Serializer = new InnerModel2Serializer();

  @override
  Map<String, dynamic> toMap(OuterModel model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'id', model.id);
      setNullableValue(
          ret,
          'list',
          nullableIterableMapper(
              model.list,
              (val) => _innerModel1Serializer.toMap(val as InnerModel1,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret,
          'map',
          nullableMapMaker(
              model.map,
              (val) => _innerModel2Serializer.toMap(val as InnerModel2,
                  withType: withType, typeKey: typeKey)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  OuterModel fromMap(Map<String, dynamic> map, {OuterModel model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new OuterModel();
    obj.id = map['id'] as String;
    obj.list = nullableIterableMapper<InnerModel1>(map['list'] as Iterable,
        (val) => _innerModel1Serializer.fromMap(val as Map<String, dynamic>));
    obj.map = nullableMapMaker<InnerModel2>(map['map'] as Map<String, dynamic>,
        (val) => _innerModel2Serializer.fromMap(val as Map<String, dynamic>));
    return obj;
  }

  @override
  String modelString() => 'OuterModel';
}
