import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'recursive.jser.dart';

class A {
  int field;

  B b;
}

class B {
  int field;

  A a;
}

@GenSerializer(serializers: const [BSerializer])
class ASerializer extends Serializer<A> with _$ASerializer {}

@GenSerializer(serializers: const [ASerializer])
class BSerializer extends Serializer<B> with _$BSerializer {}

