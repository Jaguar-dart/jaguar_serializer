import "../../models/simple/simple.dart";
import '../../models/inheritance/inheritance.dart';
import "package:test/test.dart";

void main() {
  group("Serializer", () {
    group("toMap", () {
      Simple player;

      setUp(() {
        player = Simple(
            stringF: "John",
            intF: 25,
            doubleF: 100.2,
            boolF: true,
            listF: ["Friend1", "Friend2"],
            mapF: {"1": 1, '2': 2});
      });

      test("Normal", () {
        final ser = SimpleSerializer();
        expect(ser.toMap(player), {
          'stringF': 'John',
          'intF': 25,
          'doubleF': 100.2,
          'boolF': true,
          'listF': ["Friend1", "Friend2"],
          'mapF': {"1": 1, '2': 2},
        });
      });

      test("IgnoreOne", () {
        var ser = SimpleSerializerIgnore();
        expect(ser.toMap(player), {
          'stringF': 'John',
          'intF': 25,
          'doubleF': 100.2,
          'listF': ["Friend1", "Friend2"],
          'mapF': {"1": 1, '2': 2},
        });
      });

      test("IgnoreMany", () {
        var ser = SimpleSerializerIgnores();
        expect(ser.toMap(player), {
          'stringF': 'John',
          'doubleF': 100.2,
          'mapF': {"1": 1, '2': 2},
        });
      });

      test("Alias", () {
        final ser = SimpleSerializerRename();
        expect(ser.toMap(player), {
          'S': 'John',
          'intF': 25,
          'D': 100.2,
          'B': true,
          'listF': ["Friend1", "Friend2"],
          'mapF': {"1": 1, '2': 2},
        });
      });

      test("ExcludeByDefault", () {
        var ser = SimpleSerializerExcludeDef();
        expect(ser.toMap(player), {
          'stringF': 'John',
          'intF': 25,
        });
      });

      test("Inheritance", () {
        var ser = DerivedSerializer();
        expect(
            ser.toMap(
                Derived(derived: 'Dog', based: 'Animal', mixed: 'Domestic')),
            {
              'derived': 'Dog',
              'm': 'Domestic',
              'b': 'Animal',
            });
      });
    });
  });
}
