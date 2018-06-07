// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nullable.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$ModelIntSerializer implements Serializer<ModelInt> {
  @override
  Map<String, dynamic> toMap(ModelInt model) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'bar', model.bar);
      setNullableValue(ret, 'hash', model.hash);
    }
    return ret;
  }

  @override
  ModelInt fromMap(Map map, {ModelInt model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new ModelInt();
    obj.bar = map['bar'] as int;
    return obj;
  }
}

abstract class _$NullableSerializer implements Serializer<Model> {
  final _dateTimeProcessor = const DateTimeProcessor();
  final _modelIntSerializer = new ModelIntSerializer();

  @override
  Map<String, dynamic> toMap(Model model) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo', model.foo);
      setNullableValue(
          ret, 'modelInt', _modelIntSerializer.toMap(model.modelInt));
      setNullableValue(ret, 'date', _dateTimeProcessor.serialize(model.date));
      setNullableValue(
          ret,
          'listModelInt',
          nullableIterableMapper(model.listModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt)));
      setNullableValue(
          ret,
          'mapModelInt',
          nullableMapMaker(model.mapModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt)));
      setNullableValue(
          ret,
          'listDates',
          nullableIterableMapper(model.listDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime)));
      setNullableValue(
          ret,
          'mapDates',
          nullableMapMaker(model.mapDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime)));
    }
    return ret;
  }

  @override
  Model fromMap(Map map, {Model model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Model();
    obj.foo = map['foo'] as String;
    obj.modelInt =
        _modelIntSerializer.fromMap(map['modelInt'] as Map<String, dynamic>);
    obj.date = _dateTimeProcessor.deserialize(map['date'] as String);
    obj.listModelInt = nullableIterableMapper<ModelInt>(
        map['listModelInt'] as Iterable,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>));
    obj.mapModelInt = nullableMapMaker<ModelInt>(
        map['mapModelInt'] as Map<String, dynamic>,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>));
    obj.listDates = nullableIterableMapper<DateTime>(
        map['listDates'] as Iterable,
        (val) => _dateTimeProcessor.deserialize(val as String));
    obj.mapDates = nullableMapMaker<DateTime>(
        map['mapDates'] as Map<String, dynamic>,
        (val) => _dateTimeProcessor.deserialize(val as String));
    return obj;
  }
}

abstract class _$NonNullableSerializer implements Serializer<Model> {
  final _dateTimeProcessor = const DateTimeProcessor();
  final _modelIntSerializer = new ModelIntSerializer();

  @override
  Map<String, dynamic> toMap(Model model) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNonNullableValue(ret, 'foo', model.foo);
      setNonNullableValue(
          ret, 'modelInt', _modelIntSerializer.toMap(model.modelInt));
      setNonNullableValue(
          ret, 'date', _dateTimeProcessor.serialize(model.date));
      setNonNullableValue(
          ret,
          'listModelInt',
          nonNullableIterableMapper(model.listModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt), []));
      setNonNullableValue(
          ret,
          'mapModelInt',
          nonNullableMapMaker(
              model.mapModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt),
              <String, dynamic>{}));
      setNonNullableValue(
          ret,
          'listDates',
          nonNullableIterableMapper(model.listDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime), []));
      setNonNullableValue(
          ret,
          'mapDates',
          nonNullableMapMaker(
              model.mapDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime),
              <String, dynamic>{}));
    }
    return ret;
  }

  @override
  Model fromMap(Map map, {Model model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Model();
    obj.foo = map['foo'] as String;
    obj.modelInt =
        _modelIntSerializer.fromMap(map['modelInt'] as Map<String, dynamic>);
    obj.date = _dateTimeProcessor.deserialize(map['date'] as String);
    obj.listModelInt = nonNullableIterableMapper<ModelInt>(
        map['listModelInt'] as Iterable,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>),
        <ModelInt>[]);
    obj.mapModelInt = nonNullableMapMaker<ModelInt>(
        map['mapModelInt'] as Map<String, dynamic>,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>),
        <String, ModelInt>{});
    obj.listDates = nonNullableIterableMapper<DateTime>(
        map['listDates'] as Iterable,
        (val) => _dateTimeProcessor.deserialize(val as String), <DateTime>[]);
    obj.mapDates = nonNullableMapMaker<DateTime>(
        map['mapDates'] as Map<String, dynamic>,
        (val) => _dateTimeProcessor.deserialize(val as String),
        <String, DateTime>{});
    return obj;
  }
}
