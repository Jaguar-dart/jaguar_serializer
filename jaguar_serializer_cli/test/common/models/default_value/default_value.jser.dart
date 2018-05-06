// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_value.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$DefaultValue implements Serializer<DefaultValue> {
  @override
  Map<String, dynamic> toMap(DefaultValue model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo', model.foo);
      setNullableValue(ret, 'bar', model.bar);
      setNullableValue(ret, 'list',
          nullableIterableMapper(model.list, (val) => val as String));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  DefaultValue fromMap(Map<String, dynamic> map, {DefaultValue model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new DefaultValue();
    obj.foo = map['foo'] as String ?? obj.foo;
    obj.bar = map['bar'] as String;
    obj.list = nonNullableIterableMapper<String>(
        map['list'] as Iterable, (val) => val as String, obj.list);
    return obj;
  }

  @override
  String modelString() => 'DefaultValue';
}

abstract class _$DefaultString implements Serializer<DefaultString> {
  @override
  Map<String, dynamic> toMap(DefaultString model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo', model.foo);
      setNullableValue(ret, 'bar', model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  DefaultString fromMap(Map<String, dynamic> map, {DefaultString model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new DefaultString();
    obj.foo = map['foo'] as String ?? "bar";
    obj.bar = map['bar'] as String;
    return obj;
  }

  @override
  String modelString() => 'DefaultString';
}

abstract class _$DefaultInt implements Serializer<DefaultInt> {
  @override
  Map<String, dynamic> toMap(DefaultInt model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo', model.foo);
      setNullableValue(ret, 'bar', model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  DefaultInt fromMap(Map<String, dynamic> map, {DefaultInt model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new DefaultInt();
    obj.foo = map['foo'] as int ?? 42;
    obj.bar = map['bar'] as String;
    return obj;
  }

  @override
  String modelString() => 'DefaultInt';
}

abstract class _$DefaultDouble implements Serializer<DefaultDouble> {
  @override
  Map<String, dynamic> toMap(DefaultDouble model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo', model.foo);
      setNullableValue(ret, 'bar', model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  DefaultDouble fromMap(Map<String, dynamic> map, {DefaultDouble model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new DefaultDouble();
    obj.foo = map['foo'] as double ?? 42.42;
    obj.bar = map['bar'] as String;
    return obj;
  }

  @override
  String modelString() => 'DefaultDouble';
}

abstract class _$DefaultBool implements Serializer<DefaultBool> {
  @override
  Map<String, dynamic> toMap(DefaultBool model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo', model.foo);
      setNullableValue(ret, 'bar', model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  DefaultBool fromMap(Map<String, dynamic> map, {DefaultBool model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new DefaultBool();
    obj.foo = map['foo'] as bool ?? true;
    obj.bar = map['bar'] as String;
    return obj;
  }

  @override
  String modelString() => 'DefaultBool';
}
