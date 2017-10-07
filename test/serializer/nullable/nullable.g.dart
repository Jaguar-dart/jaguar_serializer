// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.nullable;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NullableGlobal
// **************************************************************************

abstract class _$NullableGlobal implements Serializer<NullableGlobal> {
  Map toMap(NullableGlobal model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      ret["foo"] = model.foo;
      ret["bar"] = model.bar;
      ret["list"] =
          model.list?.map((String val) => val != null ? val : null)?.toList();
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  NullableGlobal fromMap(Map map, {NullableGlobal model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! NullableGlobal) {
      model = createModel();
    }
    model.foo = map["foo"];
    model.bar = map["bar"];
    model.list = map["list"]?.map((String val) => val)?.toList();
    return model;
  }

  String modelString() => "NullableGlobal";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NullableGlobal1
// **************************************************************************

abstract class _$NullableGlobal1 implements Serializer<NullableGlobal1> {
  Map toMap(NullableGlobal1 model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.foo != null) {
        ret["foo"] = model.foo;
      }
      ret["bar"] = model.bar;
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  NullableGlobal1 fromMap(Map map, {NullableGlobal1 model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! NullableGlobal1) {
      model = createModel();
    }
    model.foo = map["foo"] ?? model.foo;
    model.bar = map["bar"];
    return model;
  }

  String modelString() => "NullableGlobal1";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NonNullableGlobal
// **************************************************************************

abstract class _$NonNullableGlobal implements Serializer<NonNullableGlobal> {
  Map toMap(NonNullableGlobal model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.foo != null) {
        ret["foo"] = model.foo;
      }
      if (model.bar != null) {
        ret["bar"] = model.bar;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  NonNullableGlobal fromMap(Map map,
      {NonNullableGlobal model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! NonNullableGlobal) {
      model = createModel();
    }
    model.foo = map["foo"] ?? model.foo;
    model.bar = map["bar"] ?? model.bar;
    return model;
  }

  String modelString() => "NonNullableGlobal";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NonNullableGlobal1
// **************************************************************************

abstract class _$NonNullableGlobal1 implements Serializer<NonNullableGlobal1> {
  Map toMap(NonNullableGlobal1 model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      ret["foo"] = model.foo;
      if (model.bar != null) {
        ret["bar"] = model.bar;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  NonNullableGlobal1 fromMap(Map map,
      {NonNullableGlobal1 model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! NonNullableGlobal1) {
      model = createModel();
    }
    model.foo = map["foo"];
    model.bar = map["bar"] ?? model.bar;
    return model;
  }

  String modelString() => "NonNullableGlobal1";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NonNullableComplex
// **************************************************************************

abstract class _$NonNullableComplex implements Serializer<NonNullableComplex> {
  final TimeToStringProcessor fooTimeToStringProcessor =
      const TimeToStringProcessor();

  Map toMap(NonNullableComplex model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.foo != null) {
        ret["f"] = fooTimeToStringProcessor.serialize(model.foo);
      }
      ret["bar"] = model.bar;
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  NonNullableComplex fromMap(Map map,
      {NonNullableComplex model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! NonNullableComplex) {
      model = createModel();
    }
    model.foo = fooTimeToStringProcessor.deserialize(map["f"]) ?? model.foo;
    model.bar = map["bar"];
    return model;
  }

  String modelString() => "NonNullableComplex";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NullableComplex
// **************************************************************************

abstract class _$NullableComplex implements Serializer<NullableComplex> {
  final TimeToStringProcessor fooTimeToStringProcessor =
      const TimeToStringProcessor();

  Map toMap(NullableComplex model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      ret["f"] = fooTimeToStringProcessor.serialize(model.foo);
      ret["bar"] = model.bar;
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  NullableComplex fromMap(Map map, {NullableComplex model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! NullableComplex) {
      model = createModel();
    }
    model.foo = fooTimeToStringProcessor.deserialize(map["f"]);
    model.bar = map["bar"];
    return model;
  }

  String modelString() => "NullableComplex";
}
