// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nullable.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$NullableSerializer implements Serializer<Model> {
  final _dateTimeProcessor = const DateTimeProcessor();
  final _modelIntSerializer = new ModelIntSerializer();

  Map<String, dynamic> toMap(Model model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setNullableValue(
          ret,
          "modelInt",
          _modelIntSerializer.toMap(model.modelInt,
              withType: withType, typeKey: typeKey));
      setNullableValue(ret, "date", _dateTimeProcessor.serialize(model.date));
      setNullableValue(
          ret,
          "listModelInt",
          nullableIterableMapper(
              model.listModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret,
          "mapModelInt",
          nullableMapMaker(
              model.mapModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt,
                  withType: withType, typeKey: typeKey)));
      setNullableValue(
          ret,
          "listDates",
          nullableIterableMapper(model.listDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime)));
      setNullableValue(
          ret,
          "mapDates",
          nullableMapMaker(model.mapDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Model fromMap(Map<String, dynamic> map, {Model model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Model) {
      model = new Model();
    }
    model.foo = map["foo"] as String;
    model.modelInt = _modelIntSerializer
        .fromMap(map["modelInt"] as Map<String, dynamic>, typeKey: typeKey);
    model.date = _dateTimeProcessor.deserialize(map["date"] as String);
    model.listModelInt = nullableIterableMapper<ModelInt>(
        map["listModelInt"] as Iterable,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.mapModelInt = nullableMapMaker<ModelInt>(
        map["mapModelInt"] as Map<String, dynamic>,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey));
    model.listDates = nullableIterableMapper<DateTime>(
        map["listDates"] as Iterable,
        (val) => _dateTimeProcessor.deserialize(val as String));
    model.mapDates = nullableMapMaker<DateTime>(
        map["mapDates"] as Map<String, dynamic>,
        (val) => _dateTimeProcessor.deserialize(val as String));
    return model;
  }

  String modelString() => "Model";
}

abstract class _$NonNullableSerializer implements Serializer<Model> {
  final _dateTimeProcessor = const DateTimeProcessor();
  final _modelIntSerializer = new ModelIntSerializer();

  Map<String, dynamic> toMap(Model model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNonNullableValue(ret, "foo", model.foo);
      setNonNullableValue(
          ret,
          "modelInt",
          _modelIntSerializer.toMap(model.modelInt,
              withType: withType, typeKey: typeKey));
      setNonNullableValue(
          ret, "date", _dateTimeProcessor.serialize(model.date));
      setNonNullableValue(
          ret,
          "listModelInt",
          nonNullableIterableMapper(
              model.listModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt,
                  withType: withType, typeKey: typeKey),
              []));
      setNonNullableValue(
          ret,
          "mapModelInt",
          nonNullableMapMaker(
              model.mapModelInt,
              (val) => _modelIntSerializer.toMap(val as ModelInt,
                  withType: withType, typeKey: typeKey),
              <String, dynamic>{}));
      setNonNullableValue(
          ret,
          "listDates",
          nonNullableIterableMapper(model.listDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime), []));
      setNonNullableValue(
          ret,
          "mapDates",
          nonNullableMapMaker(
              model.mapDates,
              (val) => _dateTimeProcessor.serialize(val as DateTime),
              <String, dynamic>{}));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Model fromMap(Map<String, dynamic> map, {Model model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Model) {
      model = new Model();
    }
    model.foo = map["foo"] as String;
    model.modelInt = _modelIntSerializer
        .fromMap(map["modelInt"] as Map<String, dynamic>, typeKey: typeKey);
    model.date = _dateTimeProcessor.deserialize(map["date"] as String);
    model.listModelInt = nonNullableIterableMapper<ModelInt>(
        map["listModelInt"] as Iterable,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey),
        <ModelInt>[]);
    model.mapModelInt = nonNullableMapMaker<ModelInt>(
        map["mapModelInt"] as Map<String, dynamic>,
        (val) => _modelIntSerializer.fromMap(val as Map<String, dynamic>,
            typeKey: typeKey),
        <String, ModelInt>{});
    model.listDates = nonNullableIterableMapper<DateTime>(
        map["listDates"] as Iterable,
        (val) => _dateTimeProcessor.deserialize(val as String), <DateTime>[]);
    model.mapDates = nonNullableMapMaker<DateTime>(
        map["mapDates"] as Map<String, dynamic>,
        (val) => _dateTimeProcessor.deserialize(val as String),
        <String, DateTime>{});
    return model;
  }

  String modelString() => "Model";
}
