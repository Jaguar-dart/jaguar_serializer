// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializer.test.benchmark;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class ModelTestSerializer
// **************************************************************************

abstract class _$ModelTestSerializer implements Serializer<ModelTest> {
  final InnerTestSerializer toInnerTestSerializer = new InnerTestSerializer();
  final InnerTestSerializer fromInnerTestSerializer = new InnerTestSerializer();

  Map toMap(ModelTest model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      ret["name"] = model.name;
      ret["number"] = model.number;
      ret["names"] =
          model.names?.map((String val) => val != null ? val : null)?.toList();
      ret["numbers"] =
          model.numbers?.map((num val) => val != null ? val : null)?.toList();
      ret["inner"] = model.inner
          ?.map((InnerTest val) => val != null
              ? toInnerTestSerializer.toMap(val,
                  withType: withType, typeKey: typeKey)
              : null)
          ?.toList();
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  ModelTest fromMap(Map map, {ModelTest model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! ModelTest) {
      model = createModel();
    }
    model.name = map["name"];
    model.number = map["number"];
    model.names = map["names"]?.map((String val) => val)?.toList();
    model.numbers = map["numbers"]?.map((num val) => val)?.toList();
    model.inner = map["inner"]
        ?.map(
            (Map val) => fromInnerTestSerializer.fromMap(val, typeKey: typeKey))
        ?.toList();
    return model;
  }

  String modelString() => "ModelTest";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class InnerTestSerializer
// **************************************************************************

abstract class _$InnerTestSerializer implements Serializer<InnerTest> {
  Map toMap(InnerTest model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      ret["name"] = model.name;
      ret["names"] =
          model.names?.map((String val) => val != null ? val : null)?.toList();
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  InnerTest fromMap(Map map, {InnerTest model, String typeKey}) {
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

  String modelString() => "InnerTest";
}
