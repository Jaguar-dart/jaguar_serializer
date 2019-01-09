import "../../models/simple/simple.dart";
import '../../models/inheritance/inheritance.dart';
import "package:test/test.dart";

void main() {
  group("Serializer", () {
    group("fromMap", () {
      Map<String, dynamic> m;

      setUp(() {
        m = {
          'stringF': 'John',
          'intF': 25,
          'doubleF': 100.2,
          'boolF': true,
          'listF': ["Friend1", "Friend2"],
          'mapF': {"1": 1, '2': 2},
        };
      });

      test("Normal", () {
        var ser = new SimpleSerializer();
        expect(
            ser.fromMap(m),
            new Simple(
                stringF: "John",
                intF: 25,
                doubleF: 100.2,
                boolF: true,
                listF: ["Friend1", "Friend2"],
                mapF: {"1": 1, '2': 2}));
      });

      // Ignore field
      test("IgnoreOne", () {
        var ser = new SimpleSerializerIgnore();
        expect(
            ser.fromMap(m),
            new Simple(
                stringF: "John",
                intF: 25,
                doubleF: 100.2,
                listF: ["Friend1", "Friend2"],
                mapF: {"1": 1, '2': 2}));
      });

      // Ignore fields
      test("IgnoreMany", () {
        var ser = new SimpleSerializerIgnores();
        expect(
            ser.fromMap(m),
            new Simple(
                stringF: "John", doubleF: 100.2, mapF: {"1": 1, '2': 2}));
      });

      test("Alias", () {
        m.remove('stringF');
        m.remove('doubleF');
        m.remove('boolF');

        m["S"] = "John";
        m["D"] = 100.2;
        m["B"] = true;

        var ser = new SimpleSerializerRename();
        expect(
            ser.fromMap(m),
            new Simple(
                stringF: "John",
                intF: 25,
                doubleF: 100.2,
                boolF: true,
                listF: ["Friend1", "Friend2"],
                mapF: {"1": 1, '2': 2}));
      });

      test("ExcludeByDefault", () {
        var ser = new SimpleSerializerExcludeDef();
        expect(ser.fromMap(m), new Simple(stringF: 'John', intF: 25));
      });

      /* TODO
      test("DefaultValue", () {
        var ser = new SimpleSerializerWithDefaults();
        expect(
            ser.fromMap({}),
            new Simple(
                stringF: "Lejard",
                intF: 25,
                doubleF: 100.0,
                boolF: true,
                listF: [],
                mapF: {}));
      });
      */

      test("Inheritance", () {
        var ser = new DerivedSerializer();
        expect(
            ser.fromMap({
              'derived': 'Dog',
              'm': 'Domestic',
              'b': 'Animal',
            }),
            new Derived(derived: 'Dog', based: 'Animal', mixed: 'Domestic'));
      });

      test("MapNonStringKey", () {
        m['mapF'] = <dynamic, dynamic>{"1": 1, '2': 2};
        var ser = new SimpleSerializer();
        expect(
            ser.fromMap(m),
            new Simple(
                stringF: "John",
                intF: 25,
                doubleF: 100.2,
                boolF: true,
                listF: ["Friend1", "Friend2"],
                mapF: {"1": 1, '2': 2}));
      });
    });
  });
}
