library serializer.test.immutable;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'immutable.g.dart';

class Foo {
  final String bar;

  Foo(this.bar);
}

class FooNamed {
  final String bar;

  FooNamed({this.bar});
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
