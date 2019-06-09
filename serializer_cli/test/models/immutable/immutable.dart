import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'immutable.jser.dart';

class Foo {
  final String bar;

  Foo(this.bar);

  bool operator ==(other) {
    if (other is Foo) return bar == other.bar;
    return false;
  }

  String toString() => FooSerializer().toMap(this).toString();

  int get hashCode => 0;
}

class FooNamed {
  final String bar;

  FooNamed({this.bar});

  bool operator ==(other) {
    if (other is FooNamed) return bar == other.bar;
    return false;
  }

  String toString() => FooNamedSerializer().toMap(this).toString();

  int get hashCode => 0;
}

class ComplexConstructor {
  final String foo;
  final int bar;
  final bool isOkay;
  final num toto;
  final Foo fooObject;
  final FooNamed fooNamedObject;

  ComplexConstructor(this.foo, this.toto, this.fooObject,
      {this.bar, this.isOkay, this.fooNamedObject});

  bool operator ==(other) {
    if (other is ComplexConstructor)
      return foo == other.foo &&
          bar == other.bar &&
          isOkay == other.isOkay &&
          toto == other.toto &&
          fooObject == other.fooObject &&
          fooNamedObject == other.fooNamedObject;
    return false;
  }

  int get hashCode => 0;
}

@GenSerializer()
class FooSerializer extends Serializer<Foo> with _$FooSerializer {}

@GenSerializer()
class FooNamedSerializer extends Serializer<FooNamed>
    with _$FooNamedSerializer {}

@GenSerializer(fields: const {
  "fooObject": const Alias<Foo>("foo_object"),
  "isOkay": const Alias<bool>("is_okay")
}, serializers: const [
  FooSerializer,
  FooNamedSerializer
])
class ComplexConstructorSerializer extends Serializer<ComplexConstructor>
    with _$ComplexConstructorSerializer {}

@GenSerializer(fields: const {
  "fooObject": const Alias<Foo>("foo_object"),
  "isOkay": const Alias<bool>("is_okay")
}, serializers: const [
  FooSerializer,
  FooNamedSerializer
], nullableFields: false)
class NonNullComplexConstructorSerializer extends Serializer<ComplexConstructor>
    with _$NonNullComplexConstructorSerializer {}
