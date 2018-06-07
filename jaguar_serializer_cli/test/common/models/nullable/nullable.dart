import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'nullable.jser.dart';

class ModelInt {
  int bar;

  ModelInt([this.bar = 42]);

  bool operator ==(other) {
    if (other is ModelInt) return bar == other.bar;
    return false;
  }

  int get hash => bar.hashCode;
}

@GenSerializer()
class ModelIntSerializer extends Serializer<ModelInt>
    with _$ModelIntSerializer {}

class Model {
  String foo;
  ModelInt modelInt;
  DateTime date;
  List<ModelInt> listModelInt;
  Map<String, ModelInt> mapModelInt;
  List<DateTime> listDates;
  Map<String, DateTime> mapDates;

  bool operator ==(other) {
    if (other is Model)
      return foo == other.foo &&
          modelInt == other.modelInt &&
          date == other.date &&
          new IterableEquality().equals(listModelInt, other.listModelInt) &&
          areMapsEqual(mapModelInt, other.mapModelInt) &&
          new IterableEquality().equals(listDates, other.listDates) &&
          areMapsEqual(mapDates, other.mapDates);
    return false;
  }
}

@GenSerializer(nullableFields: true, serializers: const [
  ModelIntSerializer
], fields: const {
  'date': const Field<DateTime>(processor: const DateTimeProcessor()),
  'listDates': const Field<DateTime>(processor: const DateTimeProcessor()),
  'mapDates': const Field<DateTime>(processor: const DateTimeProcessor())
})
class NullableSerializer extends Serializer<Model> with _$NullableSerializer {}

@GenSerializer(nullableFields: false, serializers: const [
  ModelIntSerializer
], fields: const {
  'date': const Field<DateTime>(processor: const DateTimeProcessor()),
  'listDates': const Field<DateTime>(processor: const DateTimeProcessor()),
  'mapDates': const Field<DateTime>(processor: const DateTimeProcessor())
})
class NonNullableSerializer extends Serializer<Model>
    with _$NonNullableSerializer {}

bool areMapsEqual(Map m1, Map m2) {
  if (m1 == m2) return true;
  if (m1 == null && m2 == null) return true;
  if (m1 == null || m2 == null) return false;
  if (m1.length != m2.length) return false;

  for (String key in m1.keys) {
    if (!m2.containsKey(key)) return false;
    if (m1[key] != m2[key]) return false;
  }
  return true;
}
