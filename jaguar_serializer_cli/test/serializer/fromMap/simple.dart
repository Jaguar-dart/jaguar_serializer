import "../../common/simple/simple.dart";
import '../../common/models/inheritance/inheritance.dart';
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
          'mapF': {"key1": 1, "key2": 2}
        };
      });

      test("Normal", () {
        var ser = new SimpleSerializer();
        expect(
            ser.fromMap(m),
            new Simple.make(
                stringF: "John",
                intF: 25,
                doubleF: 100.2,
                boolF: true,
                listF: ["Friend1", "Friend2"],
                mapF: {"key1": 1, "key2": 2}));
      });

      // Ignore field
      test("IgnoreOne", () {
        var ser = new SimpleSerializerIgnore();
        expect(
            ser.fromMap(m),
            new Simple.make(
                stringF: "John",
                intF: 25,
                doubleF: 100.2,
                listF: ["Friend1", "Friend2"],
                mapF: {"key1": 1, "key2": 2}));
      });

      // Ignore fields
      test("IgnoreMany", () {
        var ser = new SimpleSerializerIgnores();
        expect(
            ser.fromMap(m),
            new Simple.make(
                stringF: "John", doubleF: 100.2, mapF: {"key1": 1, "key2": 2}));
      });

      test("Alias", () {
        m["S"] = "John";
        m["D"] = 100.0;
        m["B"] = true;

        var ser = new SimpleSerializerRename();
        expect(
            ser.fromMap(m),
            new Simple.make(
                stringF: "John",
                intF: 25,
                doubleF: 100.2,
                boolF: true,
                listF: ["Friend1", "Friend2"],
                mapF: {"key1": 1, "key2": 2}));
      });

      test("Non-nullable", () {
        m.remove("confirmed");

        var ser = new PlayerSerializer();
        expect(
            ser.fromMap(m),
            new Player.make(
                name: "John",
                age: 25,
                score: 100.2,
                confirmed: null,
                friends: ["Friend1", "Friend2"]));
      });

      test("ExcludeByDefault", () {
        var ser = new PlayerSerializerExcludeDef();
        expect(ser.fromMap(m), new Player.make(name: 'John', score: 100.2));
      });

      // Ignore field
      test("DefaultValue", () {
        var ser = new PlayerSerializerWithDefaults();
        expect(
            ser.fromMap({}),
            new Player.make(
                name: "Lejard",
                age: 25,
                score: 100.0,
                confirmed: true,
                friends: []));
      });

      /* TODO
    test("default value + processor + rename", () {
      //Default date not possible, DateTime cannot be const

      /* final DefaultDate date = new DefaultDate();
      final decode = date.fromMap({});

      expect(decode.foo is DateTime, isTrue);
      expect(decode.foo, equals(DateTime.parse("1994-03-29T06:00:00Z")));
      expect(decode.bar, isNull); */
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
    });
  });
}
