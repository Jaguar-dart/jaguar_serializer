// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.benchmark;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class TestSerializer
// **************************************************************************

abstract class _$TestSerializer implements MapSerializer<Test> {
  Map toMap(Test model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.number != null) {
        ret["number"] = model.number;
      }
      if (model.names != null) {
        ret["names"] = model.names
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (model.numbers != null) {
        ret["numbers"] =
            model.numbers?.map((num val) => val != null ? val : null)?.toList();
      }
      if (model.inner != null) {
        ret["inner"] = model.inner
            ?.map((InnerTest val) => val != null
                ? JaguarSerializer
                    .getMapSerializerForType(InnerTest)
                    .toMap(val, withTypeInfo: withTypeInfo)
                : null)
            ?.toList();
      }
      if (modelString != null && withTypeInfo) {
        ret[JaguarSerializer.type_info_key] = modelString;
      }
    }
    return ret;
  }

  Test fromMap(Map map, {Test model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! Test) {
      model = createModel();
    }
    model.name = map["name"];
    model.number = map["number"];
    model.names = map["names"]?.map((String val) => val)?.toList();
    model.numbers = map["numbers"]?.map((num val) => val)?.toList();
    model.inner = map["inner"]
        ?.map((dynamic val) =>
            JaguarSerializer.getMapSerializerForType(InnerTest).fromMap(val))
        ?.toList();
    return model;
  }

  String get modelString => "Test";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class InnerTestSerializer
// **************************************************************************

abstract class _$InnerTestSerializer implements MapSerializer<InnerTest> {
  Map toMap(InnerTest model, {bool withTypeInfo: false}) {
    Map ret = new Map();
    if (model != null) {
      if (model.name != null) {
        ret["name"] = model.name;
      }
      if (model.names != null) {
        ret["names"] = model.names
            ?.map((String val) => val != null ? val : null)
            ?.toList();
      }
      if (modelString != null && withTypeInfo) {
        ret[JaguarSerializer.type_info_key] = modelString;
      }
    }
    return ret;
  }

  InnerTest fromMap(Map map, {InnerTest model}) {
    if (map is! Map) {
      return null;
    }
    if (model is! InnerTest) {
      model = createModel();
    }
    model.name = map["name"];
    model.names = map["names"]?.map((String val) => val)?.toList();
    return model;
  }

  String get modelString => "InnerTest";
}
