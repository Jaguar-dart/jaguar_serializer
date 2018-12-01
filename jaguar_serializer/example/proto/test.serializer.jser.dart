// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.serializer.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$TestSerializer implements Serializer<dynamic, Person> {
  @override
  Map<String, dynamic> toMap(Person model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'name', model.name);
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'email', model.email);
    return ret;
  }

  @override
  Person fromMap(Map map) {
    if (map == null) return null;
    final obj = new Person();
    obj.name = map['name'] as String;
    obj.id = map['id'] as int;
    obj.email = map['email'] as String;
    return obj;
  }
}
