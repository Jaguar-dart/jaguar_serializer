import "package:test/test.dart";
import "../../common/models/immutable/immutable.dart";

void main() {
  group("Immutable", () {
    final fooSerializer = new FooSerializer();
    final fooNamedSerializer = new FooNamedSerializer();
    final complexConstructorSerializer = new ComplexConstructorSerializer();

    test("basic", () {
      final fooA = new Foo("bar");
      expect(fooSerializer.toMap(fooA), equals({"bar": "bar"}));

      final fooB = fooSerializer.fromMap(<String, dynamic>{"bar": "foo"});
      expect(fooB.bar, equals("foo"));
    });

    test("basic named parameters", () {
      final fooA = new FooNamed(bar: "bar");
      expect(fooNamedSerializer.toMap(fooA), equals({"bar": "bar"}));

      final fooB = fooNamedSerializer.fromMap(<String, dynamic>{"bar": "foo"});
      expect(fooB.bar, equals("foo"));
    });

    final complexMap = {
      "foo": "bar",
      "bar": 21,
      "is_okay": true,
      "toto": 42,
      "foo_object": {"bar": "bar"},
      "fooNamedObject": {"bar": "bar"}
    };

    test("positional and named parameters", () {
      final complex = complexConstructorSerializer.fromMap(complexMap);
      expect(complex.foo, equals("bar"));
      expect(complex.bar, equals(21));
      expect(complex.toto, equals(42));
    });

    test("field renaming", () {
      final complex = complexConstructorSerializer.fromMap(complexMap);
      expect(complex.isOkay, isTrue);
    });

    test("provide serializers", () {
      final complex = complexConstructorSerializer.fromMap(complexMap);
      expect(complex.fooObject.bar, equals("bar"));
      expect(complex.fooNamedObject.bar, equals("bar"));
    });
  });
}
