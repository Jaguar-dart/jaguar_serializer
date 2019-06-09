import "package:test/test.dart";
import "../../models/immutable/immutable.dart";

void main() {
  group("Serializer", () {
    group("fromMap", () {
      group("Immutable", () {
        test("RequireParam", () {
          expect(FooSerializer().fromMap({"bar": "foo"}), Foo("foo"));
        });
        test("NamedParam", () {
          expect(FooNamedSerializer().fromMap({"bar": "foo"}),
              FooNamed(bar: "foo"));
        });
        test("RequiredAndNamedParam", () {
          expect(
              ComplexConstructorSerializer().fromMap({
                "foo": "bar",
                "bar": 21,
                "is_okay": true,
                "toto": 42,
                "foo_object": {"bar": "bar"},
                "fooNamedObject": {"bar": "bar"}
              }),
              ComplexConstructor("bar", 42, Foo("bar"),
                  bar: 21, isOkay: true, fooNamedObject: FooNamed(bar: 'bar')));
        });
      });
    });
  });
}
