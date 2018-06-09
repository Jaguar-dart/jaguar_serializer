import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'import.dart';

export 'import.dart';

part 'auto_find_serializer.jser.dart';

class A {
  String field;

  A({this.field});

  bool operator ==(other) {
    if (other is A) return field == field;
    return false;
  }

  int get hashCode => 0;
}

class B {
  String field;

  A a;
  C c;

  B({this.field, this.a, this.c});

  bool operator ==(other) {
    if (other is B) return field == field && a == other.a && c == other.c;
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer()
class ASerializer extends Serializer<A> with _$ASerializer {}

@GenSerializer()
class BSerializer extends Serializer<B> with _$BSerializer {}
