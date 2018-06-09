import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'import.jser.dart';

class C {
  String field;

  C({this.field});

  bool operator ==(other) {
    if (other is C) return field == field;
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer()
class CSerializer extends Serializer<C> with _$CSerializer {}
