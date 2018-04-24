// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$ComplexSerializer implements Serializer<Complex> {
  final _rawData = const RawData();
  final _withIgnoreSerializer = new WithIgnoreSerializer();

  @override
  Map<String, dynamic> toMap(Complex model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(
          ret, 'nums', nullableIterableMapper(model.nums, (val) => val as num));
      setNullableValue(ret, 'strings',
          nullableIterableMapper(model.strings, (val) => val as String));
      setNullableValue(ret, 'bools',
          nullableIterableMapper(model.bools, (val) => val as bool));
      setNullableValue(
          ret, 'ints', nullableIterableMapper(model.ints, (val) => val as int));
      setNullableValue(ret, 'doubles',
          nullableIterableMapper(model.doubles, (val) => val as double));
      setNullableValue(
          ret,
          'ignores',
          nullableIterableMapper(
              model.ignores,
              (val) => _withIgnoreSerializer.toMap(val as WithIgnore,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret, 'numSet', nullableMapMaker(model.numSet, (val) => val as num));
      setNullableValue(ret, 'stringSet',
          nullableMapMaker(model.stringSet, (val) => val as String));
      setNullableValue(ret, 'boolSet',
          nullableMapMaker(model.boolSet, (val) => val as bool));
      setNullableValue(
          ret, 'intSet', nullableMapMaker(model.intSet, (val) => val as int));
      setNullableValue(ret, 'doubleSet',
          nullableMapMaker(model.doubleSet, (val) => val as double));
      setNullableValue(
          ret,
          'ignoreSet',
          nullableMapMaker(
              model.ignoreSet,
              (val) => _withIgnoreSerializer.toMap(val as WithIgnore,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret,
          'listInnerMap1',
          nullableMapMaker(
              model.listInnerMap1,
              (val) => nullableIterableMapper(
                  val as Iterable, (val) => val as String)));
      setNullableValue(
          ret,
          'dynamicMap',
          nullableMapMaker(
              model.dynamicMap, (val) => _rawData.serialize(val as dynamic)));
      setNullableValue(
          ret,
          'dynamicList',
          nullableIterableMapper(
              model.dynamicList, (val) => _rawData.serialize(val as dynamic)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Complex fromMap(Map<String, dynamic> map, {Complex model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Complex();
    obj.nums = nullableIterableMapper<num>(
        map['nums'] as Iterable, (val) => val as num);
    obj.strings = nullableIterableMapper<String>(
        map['strings'] as Iterable, (val) => val as String);
    obj.bools = nullableIterableMapper<bool>(
        map['bools'] as Iterable, (val) => val as bool);
    obj.ints = nullableIterableMapper<int>(
        map['ints'] as Iterable, (val) => val as int);
    obj.doubles = nullableIterableMapper<double>(
        map['doubles'] as Iterable, (val) => val as double);
    obj.ignores = nullableIterableMapper<WithIgnore>(map['ignores'] as Iterable,
        (val) => _withIgnoreSerializer.fromMap(val as Map<String, dynamic>));
    obj.numSet = nullableMapMaker<num>(
        map['numSet'] as Map<String, dynamic>, (val) => val as num);
    obj.stringSet = nullableMapMaker<String>(
        map['stringSet'] as Map<String, dynamic>, (val) => val as String);
    obj.boolSet = nullableMapMaker<bool>(
        map['boolSet'] as Map<String, dynamic>, (val) => val as bool);
    obj.intSet = nullableMapMaker<int>(
        map['intSet'] as Map<String, dynamic>, (val) => val as int);
    obj.doubleSet = nullableMapMaker<double>(
        map['doubleSet'] as Map<String, dynamic>, (val) => val as double);
    obj.ignoreSet = nullableMapMaker<WithIgnore>(
        map['ignoreSet'] as Map<String, dynamic>,
        (val) => _withIgnoreSerializer.fromMap(val as Map<String, dynamic>));
    obj.listInnerMap1 = nullableMapMaker<List<String>>(
        map['listInnerMap1'] as Map<String, dynamic>,
        (val) => nullableIterableMapper<String>(
            val as Iterable, (val) => val as String));
    obj.dynamicMap = nullableMapMaker<dynamic>(
        map['dynamicMap'] as Map<String, dynamic>,
        (val) => _rawData.deserialize(val));
    obj.dynamicList = nullableIterableMapper<dynamic>(
        map['dynamicList'] as Iterable, (val) => _rawData.deserialize(val));
    return obj;
  }

  @override
  String modelString() => 'Complex';
}

abstract class _$DataResponseJsonSerializer
    implements Serializer<DataResponse> {
  final _dataResponseProcessor = const DataResponseProcessor();

  @override
  Map<String, dynamic> toMap(DataResponse model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(
          ret,
          'allData',
          nullableIterableMapper(model.allData,
              (val) => _dataResponseProcessor.serialize(val as List)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  DataResponse fromMap(Map<String, dynamic> map, {DataResponse model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new DataResponse();
    obj.allData = nullableIterableMapper(map['allData'] as Iterable,
        (val) => _dataResponseProcessor.deserialize(val as String));
    return obj;
  }

  @override
  String modelString() => 'DataResponse';
}
