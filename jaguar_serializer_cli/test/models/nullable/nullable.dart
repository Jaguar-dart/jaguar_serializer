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

  int get hashCode => bar.hashCode;
}

@GenSerializer()
class ModelIntSerializer extends Serializer<ModelInt>
    with _$ModelIntSerializer {}

class Model {
  String builtIn;
  ModelInt serialized;
  DateTime processed;
  List<ModelInt> serializedList;
  Map<String, ModelInt> serializedMap;
  List<DateTime> processedList;
  Map<String, DateTime> processedMap;

  bool operator ==(other) {
    if (other is Model)
      return builtIn == other.builtIn &&
          serialized == other.serialized &&
          processed == other.processed &&
          new IterableEquality().equals(serializedList, other.serializedList) &&
          new MapEquality().equals(serializedMap, other.serializedMap) &&
          new IterableEquality().equals(processedList, other.processedList) &&
          new MapEquality().equals(processedMap, other.processedMap);
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer(nullableFields: false, serializers: const [ModelIntSerializer])
class NonNullableSerializer extends Serializer<Model>
    with _$NonNullableSerializer {}
