// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immutable.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$FooSerializer implements Serializer<Foo> {
  Map<String, dynamic> toMap(Foo model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "bar", model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  Foo fromMap(Map<String, dynamic> map, {Foo model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! Foo) {
      model = new Foo(map["bar"] as String);
    }
    return model;
  }

  String modelString() => "Foo";
}

abstract class _$FooNamedSerializer implements Serializer<FooNamed> {
  Map<String, dynamic> toMap(FooNamed model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "bar", model.bar);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  FooNamed fromMap(Map<String, dynamic> map, {FooNamed model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! FooNamed) {
      model = new FooNamed(bar: map["bar"] as String);
    }
    return model;
  }

  String modelString() => "FooNamed";
}

abstract class _$ComplexConstructorSerializer
    implements Serializer<ComplexConstructor> {
  final _fooSerializer = new FooSerializer();
  final _fooNamedSerializer = new FooNamedSerializer();

  Map<String, dynamic> toMap(ComplexConstructor model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo", model.foo);
      setNullableValue(ret, "bar", model.bar);
      setNullableValue(ret, "is_okay", model.isOkay);
      setNullableValue(ret, "toto", model.toto);
      setNullableValue(
          ret,
          "foo_object",
          _fooSerializer.toMap(model.fooObject,
              withType: withType, typeKey: typeKey));
      setNullableValue(
          ret,
          "fooNamedObject",
          _fooNamedSerializer.toMap(model.fooNamedObject,
              withType: withType, typeKey: typeKey));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  ComplexConstructor fromMap(Map<String, dynamic> map,
      {ComplexConstructor model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! ComplexConstructor) {
      model = new ComplexConstructor(
          map["foo"] as String,
          map["toto"] as num,
          _fooSerializer.fromMap(map["foo_object"] as Map<String, dynamic>,
              typeKey: typeKey),
          bar: map["bar"] as int,
          isOkay: map["is_okay"] as bool,
          fooNamedObject: _fooNamedSerializer.fromMap(
              map["fooNamedObject"] as Map<String, dynamic>,
              typeKey: typeKey));
    }
    return model;
  }

  String modelString() => "ComplexConstructor";
}
