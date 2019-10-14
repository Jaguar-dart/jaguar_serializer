import 'package:collection/collection.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'enums.jser.dart';

enum Gender {
  Female,
  Male,
}

class Model {
  Gender field;
  List<Gender> list;
  Map<String, Gender> map;

  Model({this.field, this.list, this.map});

  bool operator ==(other) {
    if (other is Model)
      return field == other.field &&
          IterableEquality().equals(list, other.list) &&
          MapEquality().equals(map, other.map);
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer()
class ModelSerializer extends Serializer<Model> with _$ModelSerializer {}
