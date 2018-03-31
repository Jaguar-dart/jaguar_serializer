import 'common/models/base/base.dart';
import 'common/models/complex/complex.dart';
import 'package:test/test.dart';

void main() {
  group("Complex", () {
    final serializer = new ComplexSerializer();

    final complex = new Complex()
      ..nums = [1, 2.2, 3]
      ..strings = ["1", "2", "3"]
      ..bools = [true, false, true]
      ..ints = [1, 2, 3]
      ..doubles = [1.1, 2.2, 3.3]
      //  ..dates = [new DateTime(2016, 12, 24), new DateTime(2016, 12, 25), new DateTime(2016, 12, 26)]
      ..ignores = [
        new WithIgnore("1337A", "ThisIsASecretA"),
        new WithIgnore("1337B", "ThisIsASecretB")
      ]
      ..numSet = {"numA": 1, "numB": 12.2}
      ..stringSet = {"strA": "1", "strB": "3"}
      ..boolSet = {"ok": true, "nok": false}
      ..intSet = {"intA": 1, "intB": 12}
      ..doubleSet = {"dblA": 1.1, "dblB": 12.1}
      // ..dateSet = {"fiesta": new DateTime(2016, 12, 24), "christmas": new DateTime(2016, 12, 25)}
      ..ignoreSet = {
        "A": new WithIgnore("1337A", "ThisIsASecretA"),
        "B": new WithIgnore("1337B", "ThisIsASecretB")
      }
      ..listInnerMap1 = {
        "test": ["123456"]
      };

    final encodedComplexNoType =
        serializer.serialize(complex) as Map<String, dynamic>;
    final encodedComplexType = serializer.serialize(complex,
        withType: true, typeKey: "_type") as Map<String, dynamic>;
    final decodedComplex =
        serializer.deserialize(encodedComplexNoType) as Complex;

    test("should encode without type", () {
      expect(encodedComplexNoType["nums"], equals([1, 2.2, 3]));
      expect(encodedComplexNoType["strings"], equals(["1", "2", "3"]));
      expect(encodedComplexNoType["bools"], equals([true, false, true]));
      expect(encodedComplexNoType["ints"], equals([1, 2, 3]));
      expect(encodedComplexNoType["doubles"], equals([1.1, 2.2, 3.3]));
      expect(
          encodedComplexNoType["ignores"],
          equals([
            {"a": "1337A"},
            {"a": "1337B"}
          ]));
      expect(encodedComplexNoType["numSet"], equals({"numA": 1, "numB": 12.2}));
      expect(encodedComplexNoType["stringSet"],
          equals({"strA": "1", "strB": "3"}));
      expect(
          encodedComplexNoType["boolSet"], equals({"ok": true, "nok": false}));
      expect(encodedComplexNoType["intSet"], equals({"intA": 1, "intB": 12}));
      expect(encodedComplexNoType["doubleSet"],
          equals({"dblA": 1.1, "dblB": 12.1}));
      expect(
          encodedComplexNoType["ignoreSet"],
          equals({
            "A": {"a": "1337A"},
            "B": {"a": "1337B"}
          }));
      expect(
          encodedComplexNoType["listInnerMap1"],
          equals({
            "test": ["123456"]
          }));
    });

    test("should encode with type", () {
      expect(
          encodedComplexType["ignores"],
          equals([
            {"a": "1337A", "_type": "WithIgnore"},
            {"a": "1337B", "_type": "WithIgnore"}
          ]));
      expect(
          encodedComplexType["ignoreSet"],
          equals({
            "A": {"a": "1337A", "_type": "WithIgnore"},
            "B": {"a": "1337B", "_type": "WithIgnore"}
          }));
      expect(encodedComplexType["_type"], equals("Complex"));
    });

    test("should decode", () {
      expect(decodedComplex.nums, [1, 2.2, 3]);
      expect(decodedComplex.strings, ["1", "2", "3"]);
      expect(decodedComplex.bools, [true, false, true]);
      expect(decodedComplex.ints, [1, 2, 3]);
      expect(decodedComplex.doubles, [1.1, 2.2, 3.3]);
      expect(decodedComplex.numSet, {"numA": 1, "numB": 12.2});
      expect(decodedComplex.stringSet, {"strA": "1", "strB": "3"});
      expect(decodedComplex.boolSet, {"ok": true, "nok": false});
      expect(decodedComplex.intSet, {"intA": 1, "intB": 12});
      expect(decodedComplex.doubleSet, {"dblA": 1.1, "dblB": 12.1});
      expect(decodedComplex.listInnerMap1, {
        "test": ["123456"]
      });
    });
  });
}
