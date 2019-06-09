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
          IterableEquality().equals(serializedList, other.serializedList) &&
          MapEquality().equals(serializedMap, other.serializedMap) &&
          IterableEquality().equals(processedList, other.processedList) &&
          MapEquality().equals(processedMap, other.processedMap);
    return false;
  }

  int get hashCode => 0;

  String toString() => NonNullableSerializer().toMap(this).toString();
}

@GenSerializer(nullableFields: false, serializers: const [ModelIntSerializer])
class NonNullableSerializer extends Serializer<Model>
    with _$NonNullableSerializer {
  @override
  T getJserDefault<T>(String field) {
    if (field == 'serialized') return ModelInt() as T;
    return null;
  }
}
