import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:collection/collection.dart';

part 'set.jser.dart';

class HasSet {
  Set<int> builtIn;

  Set<DateTime> processed;

  List<Set<int>> builtInList;

  List<Set<DateTime>> processedList;

  Map<String, Set<int>> builtInMap;

  Map<String, Set<DateTime>> processedMap;

  HasSet(
      {this.builtIn,
      this.processed,
      this.builtInList,
      this.processedList,
      this.builtInMap,
      this.processedMap});

  bool operator ==(other) {
    if (other is HasSet)
      return new IterableEquality().equals(builtIn, other.builtIn) &&
          new IterableEquality().equals(processed, other.processed) &&
          new DeepCollectionEquality().equals(builtInList, other.builtInList) &&
          new DeepCollectionEquality()
              .equals(processedList, other.processedList) &&
          new DeepCollectionEquality().equals(builtInMap, other.builtInMap) &&
          new DeepCollectionEquality().equals(processedMap, other.processedMap);
    return false;
  }
}

@GenSerializer()
class HasSetSerializer extends Serializer<HasSet> with _$HasSetSerializer {}
