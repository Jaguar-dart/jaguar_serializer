// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.default_value;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$DefaultValue implements Serializer<DefaultValue> {
  Map<String, dynamic> toMap(DefaultValue model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setNullableValue(ret, "bar", model.bar);
      setNullableValue(ret, "list",
          nullableIterableMapper(model.list, (val) => val as String));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  DefaultValue fromMap(Map<String, dynamic> map,
      {DefaultValue model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! DefaultValue) {
      model = new DefaultValue();
    }
    model.foo = map["foo"] as String ?? model.foo;
    model.bar = map["bar"] as String;
    model.list = nonNullableIterableMapper<String>(
        map["list"] as Iterable, (val) => val as String, model.list);
    return model;
  }

  String modelString() => "DefaultValue";
}

abstract class _$DefaultString implements Serializer<DefaultString> {
  Map<String, dynamic> toMap(DefaultString model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setNullableValue(ret, "bar", model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  DefaultString fromMap(Map<String, dynamic> map,
      {DefaultString model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! DefaultString) {
      model = new DefaultString();
    }
    model.foo = map["foo"] as String ?? "bar";
    model.bar = map["bar"] as String;
    return model;
  }

  String modelString() => "DefaultString";
}

abstract class _$DefaultInt implements Serializer<DefaultInt> {
  Map<String, dynamic> toMap(DefaultInt model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setNullableValue(ret, "bar", model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  DefaultInt fromMap(Map<String, dynamic> map,
      {DefaultInt model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! DefaultInt) {
      model = new DefaultInt();
    }
    model.foo = map["foo"] as int ?? 42;
    model.bar = map["bar"] as String;
    return model;
  }

  String modelString() => "DefaultInt";
}

abstract class _$DefaultDouble implements Serializer<DefaultDouble> {
  Map<String, dynamic> toMap(DefaultDouble model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setNullableValue(ret, "bar", model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  DefaultDouble fromMap(Map<String, dynamic> map,
      {DefaultDouble model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! DefaultDouble) {
      model = new DefaultDouble();
    }
    model.foo = map["foo"] as double ?? 42.42;
    model.bar = map["bar"] as String;
    return model;
  }

  String modelString() => "DefaultDouble";
}

abstract class _$DefaultBool implements Serializer<DefaultBool> {
  Map<String, dynamic> toMap(DefaultBool model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setNullableValue(ret, "bar", model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  DefaultBool fromMap(Map<String, dynamic> map,
      {DefaultBool model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! DefaultBool) {
      model = new DefaultBool();
    }
    model.foo = map["foo"] as bool ?? true;
    model.bar = map["bar"] as String;
    return model;
  }

  String modelString() => "DefaultBool";
}
