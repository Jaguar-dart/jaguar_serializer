// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_format.dart';

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$FieldFormatTestSerializer
    implements Serializer<FieldFormatTest> {
  @override
  Map<String, dynamic> toMap(FieldFormatTest model) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'foo_bar', model.fooBar);
      setNullableValue(ret, 'my_field', model.myField);
    }
    return ret;
  }

  @override
  FieldFormatTest fromMap(Map map, {FieldFormatTest model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new FieldFormatTest();
    obj.fooBar = map['foo_bar'] as String;
    obj.myField = map['my_field'] as int;
    return obj;
  }
}
