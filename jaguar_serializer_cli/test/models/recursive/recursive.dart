import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'recursive.jser.dart';

class A {
  int field;

  B b;

  A({this.b, this.field});

  bool operator==(other) {
    if(other is A) return field == other.field && b == other.b;
    return false;
  }
}

class B {
  int field;

  A a;

  B({this.a, this.field});

  bool operator==(other) {
    if(other is B) return field == other.field && a == other.a;
    return false;
  }
}

@GenSerializer(serializers: const [BSerializer])
class ASerializer extends Serializer<A> with _$ASerializer {}

@GenSerializer(serializers: const [ASerializer])
class BSerializer extends Serializer<B> with _$BSerializer {}

