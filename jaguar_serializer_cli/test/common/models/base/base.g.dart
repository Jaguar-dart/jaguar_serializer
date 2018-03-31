// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.base;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$ExcludeByDefaultCodec implements Serializer<ExcludeByDefault> {
  Map<String, dynamic> toMap(ExcludeByDefault model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "id", model.id);
      setNullableValue(ret, "name", model.name);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  ExcludeByDefault fromMap(Map<String, dynamic> map,
      {ExcludeByDefault model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! ExcludeByDefault) {
      model = new ExcludeByDefault();
    }
    model.id = map["id"] as String;
    model.name = map["name"] as String;
    return model;
  }

  String modelString() => "ExcludeByDefault";
}

abstract class _$ModelIntSerializer implements Serializer<ModelInt> {
  Map<String, dynamic> toMap(ModelInt model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "bar", model.bar);
      setNullableValue(ret, "clazzA", model.clazzA);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  ModelInt fromMap(Map<String, dynamic> map, {ModelInt model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! ModelInt) {
      model = new ModelInt();
    }
    model.bar = map["bar"] as int;
    model.clazzA = map["clazzA"] as String;
    return model;
  }

  String modelString() => "ModelInt";
}

abstract class _$ModelDoubleSerializer implements Serializer<ModelDouble> {
  Map<String, dynamic> toMap(ModelDouble model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "bar", model.bar);
      setNullableValue(ret, "clazzA", model.clazzA);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  ModelDouble fromMap(Map<String, dynamic> map,
      {ModelDouble model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! ModelDouble) {
      model = new ModelDouble();
    }
    model.bar = map["bar"] as double;
    model.clazzA = map["clazzA"] as String;
    return model;
  }

  String modelString() => "ModelDouble";
}

abstract class _$InheritanceSerializer implements Serializer<Inheritance> {
  Map<String, dynamic> toMap(Inheritance model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "clazzA", model.clazzA);
      setNullableValue(ret, "clazzB", model.clazzB);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Inheritance fromMap(Map<String, dynamic> map,
      {Inheritance model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Inheritance) {
      model = new Inheritance();
    }
    model.clazzA = map["clazzA"] as String;
    model.clazzB = map["clazzB"] as String;
    return model;
  }

  String modelString() => "Inheritance";
}

abstract class _$DateSerializer implements Serializer<Date> {
  final _dateTimeProcessor = const DateTimeProcessor();

  Map<String, dynamic> toMap(Date model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "date", _dateTimeProcessor.serialize(model.date));
      setNullableValue(ret, "clazzA", model.clazzA);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Date fromMap(Map<String, dynamic> map, {Date model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Date) {
      model = new Date();
    }
    model.date = _dateTimeProcessor.deserialize(map["date"] as String);
    model.clazzA = map["clazzA"] as String;
    return model;
  }

  String modelString() => "Date";
}

abstract class _$WithIgnoreSerializer implements Serializer<WithIgnore> {
  Map<String, dynamic> toMap(WithIgnore model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "a", model.a);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  WithIgnore fromMap(Map<String, dynamic> map,
      {WithIgnore model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! WithIgnore) {
      model = new WithIgnore();
    }
    model.a = map["a"] as String;
    return model;
  }

  String modelString() => "WithIgnore";
}

abstract class _$ModelRenamedSerializer implements Serializer<ModelRenamed> {
  Map<String, dynamic> toMap(ModelRenamed model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "renamed", model.original);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  ModelRenamed fromMap(Map<String, dynamic> map,
      {ModelRenamed model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! ModelRenamed) {
      model = new ModelRenamed();
    }
    model.original = map["renamed"] as String;
    return model;
  }

  String modelString() => "ModelRenamed";
}

abstract class _$CustomModelNameSerializer
    implements Serializer<CustomModelName> {
  Map<String, dynamic> toMap(CustomModelName model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  CustomModelName fromMap(Map<String, dynamic> map,
      {CustomModelName model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! CustomModelName) {
      model = new CustomModelName();
    }
    model.foo = map["foo"] as String;
    return model;
  }

  String modelString() => "MyCustomModelName";
}
