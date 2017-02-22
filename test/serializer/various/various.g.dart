// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.mix.models;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class ModelIntSerializer
// **************************************************************************

abstract class _$ModelIntSerializer implements MapSerializer<ModelInt> {
  Map toMap(ModelInt model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.bar != null) {
        ret["bar"] = model.bar;
      }
      if (model.clazzA != null) {
        ret["clazzA"] = model.clazzA;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  ModelInt fromMap(Map map, {ModelInt model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! ModelInt) {
      model = createModel();
    }
    model.bar = map["bar"];
    model.clazzA = map["clazzA"];
    return model;
  }

  String get modelString => "ModelInt";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class ModelDoubleSerializer
// **************************************************************************

abstract class _$ModelDoubleSerializer implements MapSerializer<ModelDouble> {
  Map toMap(ModelDouble model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.bar != null) {
        ret["bar"] = model.bar;
      }
      if (model.clazzA != null) {
        ret["clazzA"] = model.clazzA;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  ModelDouble fromMap(Map map, {ModelDouble model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! ModelDouble) {
      model = createModel();
    }
    model.bar = map["bar"];
    model.clazzA = map["clazzA"];
    return model;
  }

  String get modelString => "ModelDouble";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class InheritanceSerializer
// **************************************************************************

abstract class _$InheritanceSerializer implements MapSerializer<Inheritance> {
  Map toMap(Inheritance model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.clazzA != null) {
        ret["clazzA"] = model.clazzA;
      }
      if (model.clazzB != null) {
        ret["clazzB"] = model.clazzB;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  Inheritance fromMap(Map map, {Inheritance model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Inheritance) {
      model = createModel();
    }
    model.clazzA = map["clazzA"];
    model.clazzB = map["clazzB"];
    return model;
  }

  String get modelString => "Inheritance";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class DateSerializer
// **************************************************************************

abstract class _$DateSerializer implements MapSerializer<Date> {
  Map toMap(Date model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.date != null) {
        ret["date"] = new DateTimeProcessor(#date).to(model.date);
      }
      if (model.clazzA != null) {
        ret["clazzA"] = model.clazzA;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  Date fromMap(Map map, {Date model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Date) {
      model = createModel();
    }
    model.date = new DateTimeProcessor(#date).from(map["date"]);
    model.clazzA = map["clazzA"];
    return model;
  }

  String get modelString => "Date";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class NullTestSerializer
// **************************************************************************

abstract class _$NullTestSerializer implements MapSerializer<NullTest> {
  final ModelIntSerializer toModelIntSerializer = new ModelIntSerializer();
  final ModelIntSerializer fromModelIntSerializer = new ModelIntSerializer();

  Map toMap(NullTest model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.tests != null) {
        ret["tests"] = model.tests
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (model.test != null) {
        ret["test"] = model.test;
      }
      if (model.testModel != null) {
        ret["testModel"] = model.testModel
            ?.map((ModelInt val) => val != null
                ? toModelIntSerializer.toMap(val, withTypeInfo: withTypeInfo)
                : null)
            ?.toList();
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  NullTest fromMap(Map map, {NullTest model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! NullTest) {
      model = createModel();
    }
    model.tests = map["tests"]?.map((String val) => val)?.toList();
    model.test = map["test"];
    model.testModel = map["testModel"]
        ?.map((Map val) => fromModelIntSerializer.fromMap(val))
        ?.toList();
    return model;
  }

  String get modelString => "NullTest";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class WithIgnoreSerializer
// **************************************************************************

abstract class _$WithIgnoreSerializer implements MapSerializer<WithIgnore> {
  Map toMap(WithIgnore model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.a != null) {
        ret["a"] = model.a;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  WithIgnore fromMap(Map map, {WithIgnore model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! WithIgnore) {
      model = createModel();
    }
    model.a = map["a"];
    return model;
  }

  String get modelString => "WithIgnore";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class ModelRenamedSerializer
// **************************************************************************

abstract class _$ModelRenamedSerializer implements MapSerializer<ModelRenamed> {
  Map toMap(ModelRenamed model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.original != null) {
        ret["renamed"] = model.original;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  ModelRenamed fromMap(Map map, {ModelRenamed model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! ModelRenamed) {
      model = createModel();
    }
    model.original = map["renamed"];
    return model;
  }

  String get modelString => "ModelRenamed";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class ComplexSerializer
// **************************************************************************

abstract class _$ComplexSerializer implements MapSerializer<Complex> {
  final WithIgnoreSerializer toWithIgnoreSerializer =
      new WithIgnoreSerializer();
  final WithIgnoreSerializer fromWithIgnoreSerializer =
      new WithIgnoreSerializer();

  Map toMap(Complex model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.nums != null) {
        ret["nums"] =
            model.nums?.map((num val) => val != null ? val : null)?.toList();
      }
      if (model.strings != null) {
        ret["strings"] = model.strings
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (model.bools != null) {
        ret["bools"] =
            model.bools?.map((bool val) => val != null ? val : null)?.toList();
      }
      if (model.ints != null) {
        ret["ints"] =
            model.ints?.map((int val) => val != null ? val : null)?.toList();
      }
      if (model.doubles != null) {
        ret["doubles"] = model.doubles
            ?.map((double val) => val != null ? val : null)
            ?.toList();
      }
      if (model.ignores != null) {
        ret["ignores"] = model.ignores
            ?.map((WithIgnore val) => val != null
                ? toWithIgnoreSerializer.toMap(val, withTypeInfo: withTypeInfo)
                : null)
            ?.toList();
      }
      if (model.numSet != null) {
        ret["numSet"] =
            new MapMaker(model.numSet, (String key) => key, (num value) {
          return value;
        }).model;
      }
      if (model.stringSet != null) {
        ret["stringSet"] =
            new MapMaker(model.stringSet, (String key) => key, (String value) {
          return value;
        }).model;
      }
      if (model.boolSet != null) {
        ret["boolSet"] =
            new MapMaker(model.boolSet, (String key) => key, (bool value) {
          return value;
        }).model;
      }
      if (model.intSet != null) {
        ret["intSet"] =
            new MapMaker(model.intSet, (String key) => key, (int value) {
          return value;
        }).model;
      }
      if (model.doubleSet != null) {
        ret["doubleSet"] =
            new MapMaker(model.doubleSet, (String key) => key, (double value) {
          return value;
        }).model;
      }
      if (model.ignoreSet != null) {
        ret["ignoreSet"] = new MapMaker(model.ignoreSet, (String key) => key,
            (WithIgnore value) {
          return toWithIgnoreSerializer.toMap(value,
              withTypeInfo: withTypeInfo);
        }).model;
      }
      if (model.listInnerMap1 != null) {
        ret["listInnerMap1"] = new MapMaker(
            model.listInnerMap1, (String key) => key, (List<String> value) {
          return value?.map((String val) => val != null ? val : null)?.toList();
        }).model;
      }
      if (modelString != null && withTypeInfo) {
        ret[SerializerRepo.typeInfoKey] = modelString;
      }
    }
    return ret;
  }

  Complex fromMap(Map map, {Complex model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Complex) {
      model = createModel();
    }
    model.nums = map["nums"]?.map((num val) => val)?.toList();
    model.strings = map["strings"]?.map((String val) => val)?.toList();
    model.bools = map["bools"]?.map((bool val) => val)?.toList();
    model.ints = map["ints"]?.map((int val) => val)?.toList();
    model.doubles = map["doubles"]?.map((double val) => val)?.toList();
    model.ignores = map["ignores"]
        ?.map((Map val) => fromWithIgnoreSerializer.fromMap(val))
        ?.toList();
    model.numSet =
        new MapMaker(map["numSet"], (String key) => key, (num value) {
      return value;
    }).model as dynamic;
    model.stringSet =
        new MapMaker(map["stringSet"], (String key) => key, (String value) {
      return value;
    }).model as dynamic;
    model.boolSet =
        new MapMaker(map["boolSet"], (String key) => key, (bool value) {
      return value;
    }).model as dynamic;
    model.intSet =
        new MapMaker(map["intSet"], (String key) => key, (int value) {
      return value;
    }).model as dynamic;
    model.doubleSet =
        new MapMaker(map["doubleSet"], (String key) => key, (double value) {
      return value;
    }).model as dynamic;
    model.ignoreSet =
        new MapMaker(map["ignoreSet"], (String key) => key, (Map value) {
      return fromWithIgnoreSerializer.fromMap(value);
    }).model as dynamic;
    model.listInnerMap1 = new MapMaker(
        map["listInnerMap1"], (String key) => key, (List<String> value) {
      return value?.map((String val) => val)?.toList();
    }).model as dynamic;
    return model;
  }

  String get modelString => "Complex";
}
