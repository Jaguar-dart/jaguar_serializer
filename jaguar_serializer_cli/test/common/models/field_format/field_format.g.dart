// GENERATED CODE - DO NOT MODIFY BY HAND

part of field_format;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$FieldFormatTestSerializer
    implements Serializer<FieldFormatTest> {
  Map<String, dynamic> toMap(FieldFormatTest model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, "foo_bar", model.fooBar);
      setNullableValue(ret, "my_field", model.myField);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  FieldFormatTest fromMap(Map<String, dynamic> map,
      {FieldFormatTest model, String typeKey}) {
    if (map == null) {
      return null;
    }
    if (model is! FieldFormatTest) {
      model = new FieldFormatTest();
    }
    model.fooBar = map["foo_bar"] as String;
    model.myField = map["my_field"] as int;
    return model;
  }

  String modelString() => "FieldFormatTest";
}
