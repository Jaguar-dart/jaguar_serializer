library serializer.test.nullable;

import '../base/base.dart';

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'nullable.g.dart';

class Model {
  String foo;
  ModelInt modelInt;
  DateTime date;
  List<ModelInt> listModelInt;
  Map<String, ModelInt> mapModelInt;
  List<DateTime> listDates;
  Map<String, DateTime> mapDates;
}

@GenSerializer(nullableFields: true, serializers: const [
  ModelIntSerializer
], fields: const {
  'date': const Property<DateTime>(processor: const DateTimeProcessor()),
  'listDates': const Property<DateTime>(processor: const DateTimeProcessor()),
  'mapDates': const Property<DateTime>(processor: const DateTimeProcessor())
})
class NullableSerializer extends Serializer<Model> with _$NullableSerializer {}

@GenSerializer(nullableFields: false, serializers: const [
  ModelIntSerializer
], fields: const {
  'date': const Property<DateTime>(processor: const DateTimeProcessor()),
  'listDates': const Property<DateTime>(processor: const DateTimeProcessor()),
  'mapDates': const Property<DateTime>(processor: const DateTimeProcessor())
})
class NonNullableSerializer extends Serializer<Model>
    with _$NonNullableSerializer {}
