// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.serializer.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$TestSerializer extends Serializer<dynamic, Person> {
  _$TestSerializer({bool isDebugJsonActivated = false}) : super(_toBuffer(isDebugJsonActivated), _fromBuffer);

  static SerializerFactory _toBuffer(bool isDebugJsonActivated) {
    return (product) {
      if (isDebugJsonActivated) {
        return product.writeToJson();
      }
      return product.writeToBuffer();
    };
  }

  static Person _fromBuffer(dynamic buffer) {
    if (buffer is String) {
      return Person.fromJson(buffer);
    }
    return Person.fromBuffer(buffer as List<int>);
  }

  @override
  clone(object) {
    return object.clone();
  }
}
