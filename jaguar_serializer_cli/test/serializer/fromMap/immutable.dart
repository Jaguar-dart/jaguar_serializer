import "package:test/test.dart";
import "../../models/immutable/immutable.dart";

void main() {
  group("Serializer", () {
    group("fromMap", () {
      group("Immutable", () {
        test("RequireParam", () {
          expect(new FooSerializer().fromMap({"bar": "foo"}), new Foo("foo"));
        });
        test("NamedParam", () {
          expect(new FooNamedSerializer().fromMap({"bar": "foo"}),
              new FooNamed(bar: "foo"));
        });
        test("RequiredAndNamedParam", () {
          expect(
              new ComplexConstructorSerializer().fromMap({
                "foo": "bar",
                "bar": 21,
                "is_okay": true,
                "toto": 42,
                "foo_object": {"bar": "bar"},
                "fooNamedObject": {"bar": "bar"}
              }),
              new ComplexConstructor("bar", 42, new Foo("bar"),
                  bar: 21,
                  isOkay: true,
                  fooNamedObject: new FooNamed(bar: 'bar')));
        });
      });
    });
  });
}
