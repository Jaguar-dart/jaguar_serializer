// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$ExcludeByDefaultCodec implements Serializer<ExcludeByDefault> {
  @override
  Map<String, dynamic> toMap(ExcludeByDefault model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'id', model.id);
      setNullableValue(ret, 'name', model.name);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  ExcludeByDefault fromMap(Map<String, dynamic> map, {ExcludeByDefault model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new ExcludeByDefault();
    obj.id = map['id'] as String;
    obj.name = map['name'] as String;
    return obj;
  }

  @override
  String modelString() => 'ExcludeByDefault';
}

abstract class _$ModelIntSerializer implements Serializer<ModelInt> {
  @override
  Map<String, dynamic> toMap(ModelInt model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'bar', model.bar);
      setNullableValue(ret, 'clazzA', model.clazzA);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  ModelInt fromMap(Map<String, dynamic> map, {ModelInt model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new ModelInt();
    obj.bar = map['bar'] as int;
    obj.clazzA = map['clazzA'] as String;
    return obj;
  }

  @override
  String modelString() => 'ModelInt';
}

abstract class _$ModelDoubleSerializer implements Serializer<ModelDouble> {
  @override
  Map<String, dynamic> toMap(ModelDouble model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'bar', model.bar);
      setNullableValue(ret, 'clazzA', model.clazzA);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  ModelDouble fromMap(Map<String, dynamic> map, {ModelDouble model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new ModelDouble();
    obj.bar = map['bar'] as double;
    obj.clazzA = map['clazzA'] as String;
    return obj;
  }

  @override
  String modelString() => 'ModelDouble';
}

abstract class _$InheritanceSerializer implements Serializer<Inheritance> {
  @override
  Map<String, dynamic> toMap(Inheritance model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'clazzB', model.clazzB);
      setNullableValue(ret, 'clazzA', model.clazzA);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Inheritance fromMap(Map<String, dynamic> map, {Inheritance model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Inheritance();
    obj.clazzB = map['clazzB'] as String;
    obj.clazzA = map['clazzA'] as String;
    return obj;
  }

  @override
  String modelString() => 'Inheritance';
}

abstract class _$DateSerializer implements Serializer<Date> {
  final _dateTimeProcessor = const DateTimeProcessor();

  @override
  Map<String, dynamic> toMap(Date model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'date', _dateTimeProcessor.serialize(model.date));
      setNullableValue(ret, 'clazzA', model.clazzA);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Date fromMap(Map<String, dynamic> map, {Date model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Date();
    obj.date = _dateTimeProcessor.deserialize(map['date'] as String);
    obj.clazzA = map['clazzA'] as String;
    return obj;
  }

  @override
  String modelString() => 'Date';
}

abstract class _$WithIgnoreSerializer implements Serializer<WithIgnore> {
  @override
  Map<String, dynamic> toMap(WithIgnore model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'a', model.a);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  WithIgnore fromMap(Map<String, dynamic> map, {WithIgnore model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new WithIgnore();
    obj.a = map['a'] as String;
    return obj;
  }

  @override
  String modelString() => 'WithIgnore';
}

abstract class _$ModelRenamedSerializer implements Serializer<ModelRenamed> {
  @override
  Map<String, dynamic> toMap(ModelRenamed model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'renamed', model.original);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  ModelRenamed fromMap(Map<String, dynamic> map, {ModelRenamed model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new ModelRenamed();
    obj.original = map['renamed'] as String;
    return obj;
  }

  @override
  String modelString() => 'ModelRenamed';
}

abstract class _$CustomModelNameSerializer
    implements Serializer<CustomModelName> {
  @override
  Map<String, dynamic> toMap(CustomModelName model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo', model.foo);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  CustomModelName fromMap(Map<String, dynamic> map, {CustomModelName model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new CustomModelName();
    obj.foo = map['foo'] as String;
    return obj;
  }

  @override
  String modelString() => 'MyCustomModelName';
}
