library serializer.test.mix.models;

import 'package:jaguar_serializer/serializer.dart';
import 'package:test/test.dart';

part 'various.g.dart';

abstract class ClassA {
  String clazzA = "ClassA";
}

abstract class ClassB {
  String clazzB = "ClassB";

  ClassB(this.clazzB);
}

class ModelInt extends ClassA {
  int _bar;

  int get bar => _bar;

  set bar(int value) => _bar = value;

  ModelInt([this._bar = 42]);
}

class ModelDouble extends ClassA {
  double bar;

  ModelDouble([this.bar = 42.42]);
}

class Inheritance extends ClassB with ClassA {
  Inheritance() : super("inheritance");
}

class Date extends ClassA {
  DateTime date;

  Date([this.date]);
}

class NullTest {
  List<String> tests = null;
  String test = null;
  List<ModelInt> testModel = null;

  NullTest();
}

class ModelRenamed {
  String original;

  ModelRenamed(this.original);
}

class WithIgnore {
  String a;
  String secret;

  WithIgnore(this.a, this.secret);
}

class Complex {
  List<num> nums;
  List<String> strings;
  List<bool> bools;
  List<int> ints;
  List<double> doubles;
  //List<DateTime> dates; //TODO: processField inside List or Map
  List<WithIgnore> ignores;
  Map<String, num> numSet;
  Map<String, String> stringSet;
  Map<String, bool> boolSet;
  Map<String, int> intSet;
  Map<String, double> doubleSet;
  // Map<String, DateTime> dateSet;//TODO: processField inside List or Map
  Map<String, WithIgnore> ignoreSet;
  Map<String, List<String>> listInnerMap1;
  //Map<String, List> listInnerMap2; //TODO: dynamic
}

@GenSerializer()
class ModelIntSerializer extends MapSerializer<ModelInt>
    with _$ModelIntSerializer {
  @override
  ModelInt createModel() => new ModelInt();
}

@GenSerializer()
class ModelDoubleSerializer extends MapSerializer<ModelDouble>
    with _$ModelDoubleSerializer {
  @override
  ModelDouble createModel() => new ModelDouble();
}

@GenSerializer()
class InheritanceSerializer extends MapSerializer<Inheritance>
    with _$InheritanceSerializer {
  @override
  Inheritance createModel() => new Inheritance();
}

@GenSerializer()
@DateTimeProcessor(#date)
class DateSerializer extends MapSerializer<Date> with _$DateSerializer {
  @override
  Date createModel() => new Date();
}

@GenSerializer()
class NullTestSerializer extends MapSerializer<NullTest>
    with _$NullTestSerializer {
  @override
  NullTest createModel() => new NullTest();

  NullTestSerializer() {
    addSerializer(new ModelIntSerializer());
  }
}

@GenSerializer()
@IgnoreFields(const [#secret])
class WithIgnoreSerializer extends MapSerializer<WithIgnore>
    with _$WithIgnoreSerializer {
  @override
  WithIgnore createModel() => new WithIgnore(null, null);
}

@GenSerializer()
@EnDecodeField(#original, asAndFrom: 'renamed')
class ModelRenamedSerializer extends MapSerializer<ModelRenamed>
    with _$ModelRenamedSerializer {
  @override
  ModelRenamed createModel() => new ModelRenamed(null);
}

@GenSerializer()
@DateTimeProcessor(#dates)
class ComplexSerializer extends MapSerializer<Complex>
    with _$ComplexSerializer {
  @override
  Complex createModel() => new Complex();

  ComplexSerializer() {
    addSerializer(new WithIgnoreSerializer());
  }
}

@DefineFieldProcessor()
class DateTimeProcessor implements FieldProcessor<DateTime, String> {
  final Symbol field;

  const DateTimeProcessor(this.field);

  DateTime from(String input) {
    return DateTime.parse(input);
  }

  String to(DateTime value) {
    return value.toIso8601String();
  }
}

void main() {
  Serializer serializer;

  setUpAll(() {
    serializer = new SerializerJson()
      ..addSerializer(new ModelIntSerializer())
      ..addSerializer(new ModelDoubleSerializer())
      ..addSerializer(new DateSerializer())
      ..addSerializer(new WithIgnoreSerializer())
      ..addSerializer(new NullTestSerializer())
      ..addSerializer(new ModelRenamedSerializer())
      ..addSerializer(new ComplexSerializer())
      ..addSerializer(new InheritanceSerializer());
  });

  group('Various - toMap', () {
    test('Inheritance', () {
      Inheritance d = new Inheritance();
      expect(serializer.toMap(d), {"clazzA": "classA", "clazzB": "classB"});
      expect(serializer.toMap(d, withTypeInfo: true), {
        "clazzA": "classA",
        "clazzB": "classB",
        JaguarSerializer.type_info_key: "Inheritance"
      });
    }, skip: true);

    test('ModelInt', () {
      ModelInt d = new ModelInt();
      expect(serializer.toMap(d), {"bar": 42, "clazzA": "classA"});
      expect(serializer.toMap(d, withTypeInfo: true), {
        "bar": 42,
        "clazzA": "classA",
        JaguarSerializer.type_info_key: "ModelInt"
      });
    }, skip: true);

    test('ModelDouble', () {
      ModelDouble d = new ModelDouble();
      expect(serializer.toMap(d), {"bar": 42.42, "clazzA": "classA"});
      expect(serializer.toMap(d, withTypeInfo: true), {
        "bar": 42.42,
        "clazzA": "classA",
        JaguarSerializer.type_info_key: "ModelDouble"
      });
    }, skip: true);

    test("DateTimeProcessor", () {
      DateTime now = new DateTime.now();

      Date d = new Date(now);
      expect(serializer.toMap(d),
          {"date": now.toIso8601String(), "clazzA": "classA"});
      expect(serializer.toMap(d, withTypeInfo: true), {
        "date": now.toIso8601String(),
        "clazzA": "classA",
        JaguarSerializer.type_info_key: "Date"
      });
    }, skip: true);

    test("Null Test", () {
      NullTest d = new NullTest();
      d.testModel = [null];
      d.test = "test";
      expect(serializer.toMap(d), {
        "test": "test",
        "testModel": [null]
      });
      expect(serializer.toMap(d, withTypeInfo: true), {
        "test": "test",
        "testModel": [null],
        JaguarSerializer.type_info_key: "NullTest"
      });
    });

    test("Ignore attribute", () {
      WithIgnore ignore = new WithIgnore("test", "foo");

      expect(serializer.toMap(ignore), {"a": "test"});
      expect(ignore.secret, "foo");
    });

    test("Serialized name", () {
      ModelRenamed model = new ModelRenamed("foo");

      expect(serializer.toMap(model), {"renamed": "foo"});
    });

    test("Complex", () {
      Complex complex = new Complex()
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

      expect(serializer.toMap(complex), {
        "nums": [1, 2.2, 3],
        "strings": ["1", "2", "3"],
        "bools": [true, false, true],
        "ints": [1, 2, 3],
        "doubles": [1.1, 2.2, 3.3],
        // "dates": ["2016-12-24T00:00:00.000", "2016-12-25T00:00:00.000", "2016-12-26T00:00:00.000"],
        "ignores": [
          {"a": "1337A"},
          {"a": "1337B"}
        ],
        "numSet": {"numA": 1, "numB": 12.2},
        "stringSet": {"strA": "1", "strB": "3"},
        "boolSet": {"ok": true, "nok": false},
        "intSet": {"intA": 1, "intB": 12},
        "doubleSet": {"dblA": 1.1, "dblB": 12.1},
        //  "dateSet": {"fiesta": "2016-12-24T00:00:00.000", "christmas": "2016-12-25T00:00:00.000"},
        "ignoreSet": {
          "A": {"a": "1337A"},
          "B": {"a": "1337B"}
        },
        "listInnerMap1": {
          "test": ["123456"]
        }
      });

      expect(serializer.toMap(complex, withTypeInfo: true), {
        "@t": "$Complex",
        "nums": [1, 2.2, 3],
        "strings": ["1", "2", "3"],
        "bools": [true, false, true],
        "ints": [1, 2, 3],
        "doubles": [1.1, 2.2, 3.3],
        // "dates": ["2016-12-24T00:00:00.000", "2016-12-25T00:00:00.000", "2016-12-26T00:00:00.000"],
        "ignores": [
          {"a": "1337A", "@t": "$WithIgnore"},
          {"a": "1337B", "@t": "$WithIgnore"}
        ],
        "numSet": {"numA": 1, "numB": 12.2},
        "stringSet": {"strA": "1", "strB": "3"},
        "boolSet": {"ok": true, "nok": false},
        "intSet": {"intA": 1, "intB": 12},
        "doubleSet": {"dblA": 1.1, "dblB": 12.1},
        //  "dateSet": {"fiesta": "2016-12-24T00:00:00.000", "christmas": "2016-12-25T00:00:00.000"},
        "ignoreSet": {
          "A": {"a": "1337A", "@t": "$WithIgnore"},
          "B": {"a": "1337B", "@t": "$WithIgnore"}
        },
        "listInnerMap1": {
          "test": ["123456"]
        }
      });
    });
  });

  group('Various - fromMap', () {
    test('Inheritance', () {
      Inheritance d = serializer
          .fromMap({"clazzA": "classA", "clazzB": "classB"}, type: Inheritance);
      expect(d.clazzA, "classA");
      expect(d.clazzB, "classB");

      d = serializer.fromMap({
        "clazzA": "classA",
        "clazzB": "classB",
        JaguarSerializer.type_info_key: "Inheritance"
      });
      expect(d.clazzA, "classA");
      expect(d.clazzB, "classB");
    }, skip: true);

    test('ModelInt', () {
      ModelInt d =
          serializer.fromMap({"bar": 42, "clazzA": "classA"}, type: ModelInt);
      expect(d.bar, 42);
      expect(d.clazzA, "classA");
      d = serializer.fromMap({
        "bar": 42,
        "clazzA": "classA",
        JaguarSerializer.type_info_key: "ModelInt"
      });
      expect(d.bar, 42);
      expect(d.clazzA, "classA");
    }, skip: true);

    test('ModelDouble', () {
      ModelDouble d = serializer
          .fromMap({"bar": 42.42, "clazzA": "classA"}, type: ModelDouble);
      expect(d.bar, 42.42);
      expect(d.clazzA, "classA");
      d = serializer.fromMap({
        "bar": 42.42,
        "clazzA": "classA",
        JaguarSerializer.type_info_key: "ModelDouble"
      });
      expect(d.bar, 42.42);
      expect(d.clazzA, "classA");
    }, skip: true);

    test("DateTimeProcessor", () {
      DateTime now = new DateTime.now();
      Date d = serializer.fromMap(
          {"date": now.toIso8601String(), "clazzA": "classA"},
          type: Date);
      expect(d.date, now);
      d = serializer.fromMap({
        "date": now.toIso8601String(),
        "clazzA": "classA",
        JaguarSerializer.type_info_key: "Date"
      });
      expect(d.date, now);
    }, skip: true);

    test("Null Test", () {
      NullTest d = serializer.fromMap({
        "test": "test",
        "testModel": [null]
      }, type: NullTest);
      expect(d.test, "test");
      expect(d.testModel, [null]);
      d = serializer.fromMap({
        "test": "test",
        "testModel": [null],
        JaguarSerializer.type_info_key: "NullTest"
      }, type: NullTest);
      expect(d.test, "test");
      expect(d.testModel, [null]);
    });

    test("Ignore attribute", () {
      WithIgnore ignore = serializer.fromMap({"a": "test"}, type: WithIgnore);
      expect(ignore.a, "test");
      expect(ignore.secret, isNull);
    });

    test("Serialized name", () {
      ModelRenamed model =
          serializer.fromMap({"renamed": "foo"}, type: ModelRenamed);

      expect(model.original, "foo");
    });

    test("Complex", () {
      Complex complex = serializer.fromMap({
        "@t": "$Complex",
        "nums": [1, 2.2, 3],
        "strings": ["1", "2", "3"],
        "bools": [true, false, true],
        "ints": [1, 2, 3],
        "doubles": [1.1, 2.2, 3.3],
        // "dates": ["2016-12-24T00:00:00.000", "2016-12-25T00:00:00.000", "2016-12-26T00:00:00.000"],
        "ignores": [
          {"a": "1337A", "@t": "$WithIgnore"},
          {"a": "1337B", "@t": "$WithIgnore"}
        ],
        "numSet": {"numA": 1, "numB": 12.2},
        "stringSet": {"strA": "1", "strB": "3"},
        "boolSet": {"ok": true, "nok": false},
        "intSet": {"intA": 1, "intB": 12},
        "doubleSet": {"dblA": 1.1, "dblB": 12.1},
        //  "dateSet": {"fiesta": "2016-12-24T00:00:00.000", "christmas": "2016-12-25T00:00:00.000"},
        "ignoreSet": {
          "A": {"a": "1337A", "@t": "$WithIgnore"},
          "B": {"a": "1337B", "@t": "$WithIgnore"}
        },
        "listInnerMap1": {
          "test": ["123456"]
        }
      });

      expect(complex.nums, [1, 2.2, 3]);
      expect(complex.strings, ["1", "2", "3"]);
      expect(complex.bools, [true, false, true]);
      expect(complex.ints, [1, 2, 3]);
      expect(complex.doubles, [1.1, 2.2, 3.3]);
      expect(complex.numSet, {"numA": 1, "numB": 12.2});
      expect(complex.stringSet, {"strA": "1", "strB": "3"});
      expect(complex.boolSet, {"ok": true, "nok": false});
      expect(complex.intSet, {"intA": 1, "intB": 12});
      expect(complex.doubleSet, {"dblA": 1.1, "dblB": 12.1});
      expect(complex.listInnerMap1, {
        "test": ["123456"]
      });
    });
  });
}
