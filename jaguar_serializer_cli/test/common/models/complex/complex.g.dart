// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$ComplexSerializer implements Serializer<Complex> {
  final _rawData = const RawData();
  final _withIgnoreSerializer = new WithIgnoreSerializer();

  Map<String, dynamic> toMap(Complex model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(
          ret, "nums", nullableIterableMapper(model.nums, (val) => val as num));
      setNullableValue(ret, "strings",
          nullableIterableMapper(model.strings, (val) => val as String));
      setNullableValue(ret, "bools",
          nullableIterableMapper(model.bools, (val) => val as bool));
      setNullableValue(
          ret, "ints", nullableIterableMapper(model.ints, (val) => val as int));
      setNullableValue(ret, "doubles",
          nullableIterableMapper(model.doubles, (val) => val as double));
      setNullableValue(
          ret,
          "ignores",
          nullableIterableMapper(
              model.ignores,
              (val) => _withIgnoreSerializer.toMap(val as WithIgnore,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret, "numSet", nullableMapMaker(model.numSet, (val) => val as num));
      setNullableValue(ret, "stringSet",
          nullableMapMaker(model.stringSet, (val) => val as String));
      setNullableValue(ret, "boolSet",
          nullableMapMaker(model.boolSet, (val) => val as bool));
      setNullableValue(
          ret, "intSet", nullableMapMaker(model.intSet, (val) => val as int));
      setNullableValue(ret, "doubleSet",
          nullableMapMaker(model.doubleSet, (val) => val as double));
      setNullableValue(
          ret,
          "ignoreSet",
          nullableMapMaker(
              model.ignoreSet,
              (val) => _withIgnoreSerializer.toMap(val as WithIgnore,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret,
          "listInnerMap1",
          nullableMapMaker(
              model.listInnerMap1,
              (val) => nullableIterableMapper(
                  val as Iterable, (val) => val as String)));
      setNullableValue(
          ret,
          "dynamicMap",
          nullableMapMaker(
              model.dynamicMap, (val) => _rawData.serialize(val as dynamic)));
      setNullableValue(
          ret,
          "dynamicList",
          nullableIterableMapper(
              model.dynamicList, (val) => _rawData.serialize(val as dynamic)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Complex fromMap(Map<String, dynamic> map, {Complex model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Complex) {
      model = new Complex();
    }
    model.nums = nullableIterableMapper<num>(
        map["nums"] as Iterable, (val) => val as num);
    model.strings = nullableIterableMapper<String>(
        map["strings"] as Iterable, (val) => val as String);
    model.bools = nullableIterableMapper<bool>(
        map["bools"] as Iterable, (val) => val as bool);
    model.ints = nullableIterableMapper<int>(
        map["ints"] as Iterable, (val) => val as int);
    model.doubles = nullableIterableMapper<double>(
        map["doubles"] as Iterable, (val) => val as double);
    model.ignores = nullableIterableMapper<WithIgnore>(
        map["ignores"] as Iterable,
        (val) => _withIgnoreSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.numSet = nullableMapMaker<num>(
        map["numSet"] as Map<String, dynamic>, (val) => val as num);
    model.stringSet = nullableMapMaker<String>(
        map["stringSet"] as Map<String, dynamic>, (val) => val as String);
    model.boolSet = nullableMapMaker<bool>(
        map["boolSet"] as Map<String, dynamic>, (val) => val as bool);
    model.intSet = nullableMapMaker<int>(
        map["intSet"] as Map<String, dynamic>, (val) => val as int);
    model.doubleSet = nullableMapMaker<double>(
        map["doubleSet"] as Map<String, dynamic>, (val) => val as double);
    model.ignoreSet = nullableMapMaker<WithIgnore>(
        map["ignoreSet"] as Map<String, dynamic>,
        (val) => _withIgnoreSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.listInnerMap1 = nullableMapMaker<List<String>>(
        map["listInnerMap1"] as Map<String, dynamic>,
        (val) => nullableIterableMapper<String>(
            val as Iterable, (val) => val as String));
    model.dynamicMap = nullableMapMaker<dynamic>(
        map["dynamicMap"] as Map<String, dynamic>,
        (val) => _rawData.deserialize(val));
    model.dynamicList = nullableIterableMapper<dynamic>(
        map["dynamicList"] as Iterable, (val) => _rawData.deserialize(val));
    return model;
  }

  String modelString() => "Complex";
}
