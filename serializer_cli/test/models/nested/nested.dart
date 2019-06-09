import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'nested.jser.dart';

/// A serialized model used in [NestedList] and [NestedMap]
class Leaf {
  String color;

  Leaf({this.color});

  bool operator ==(other) {
    if (other is Leaf) return color == other.color;
    return false;
  }

  int get hashCode => color?.hashCode;
}

@GenSerializer()
class LeafSerializer extends Serializer<Leaf> with _$LeafSerializer {}

class NestedList {
  /// Tests nested list of built-ins
  List<List<String>> strings;

  /// Tests nested list of processor fields
  List<List<DateTime>> dates;

  /// Tests nested list of serialized objects
  List<List<Leaf>> leafs;

  NestedList({this.strings, this.dates, this.leafs});

  bool operator ==(other) {
    if (other is NestedList) {
      return DeepCollectionEquality().equals(strings, other.strings) &&
          DeepCollectionEquality().equals(dates, other.dates) &&
          DeepCollectionEquality().equals(leafs, other.leafs);
    }
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer(
    serializers: const [LeafSerializer],
    fields: const {"dates": const Field(processor: const DateTimeProcessor())})
class NestedListSerializer extends Serializer<NestedList>
    with _$NestedListSerializer {}

/// A model with nested maps of various complexity
class NestedMap {
  /// Nested map of built-ins
  Map<String, Map<String, String>> strings;

  /// Nested map of processor fields
  Map<String, Map<String, DateTime>> dates;

  /// Nested map of serialized objects
  Map<String, Map<String, Leaf>> leafs;

  NestedMap({this.strings, this.dates, this.leafs});

  bool operator ==(other) {
    if (other is NestedMap) {
      return DeepCollectionEquality().equals(strings, other.strings) &&
          DeepCollectionEquality().equals(dates, other.dates) &&
          DeepCollectionEquality().equals(leafs, other.leafs);
    }
    return false;
  }

  String toString() => NestedMapSerializer().toMap(this).toString();

  int get hashCode => 0;
}

@GenSerializer(
    serializers: const [LeafSerializer],
    fields: const {"dates": const Field(processor: const DateTimeProcessor())})
class NestedMapSerializer extends Serializer<NestedMap>
    with _$NestedMapSerializer {}
