library serializer.test.default_value;

import '../various/various.dart';
import 'package:test/test.dart';

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'default_value.g.dart';

@GenSerializer(fields: const {'foo': nonNullable, "list": nonNullable})
class DefaultValue extends Serializer<DefaultValue> with _$DefaultValue {
  String foo;
  String bar;
  List<String> list;

  DefaultValue({this.foo: "bar", this.list: const ["foo", "bar"]});

  @override
  DefaultValue createModel() => new DefaultValue();
}

@GenSerializer(fields: const {'foo': const DefaultStringValue("bar")})
class DefaultString extends Serializer<DefaultString> with _$DefaultString {
  String foo;
  String bar;

  DefaultString({this.foo});

  @override
  DefaultString createModel() => new DefaultString();
}

@GenSerializer(fields: const {'foo': const DefaultIntValue(42)})
class DefaultInt extends Serializer<DefaultInt> with _$DefaultInt {
  int foo;
  String bar;

  DefaultInt({this.foo});

  @override
  DefaultInt createModel() => new DefaultInt();
}

@GenSerializer(fields: const {'foo': const DefaultDoubleValue(42.42)})
class DefaultDouble extends Serializer<DefaultDouble> with _$DefaultDouble {
  double foo;
  String bar;

  DefaultDouble({this.foo});

  @override
  DefaultDouble createModel() => new DefaultDouble();
}

@GenSerializer(fields: const {'foo': const DefaultBoolValue(true)})
class DefaultBool extends Serializer<DefaultBool> with _$DefaultBool {
  bool foo;
  String bar;

  DefaultBool({this.foo});

  @override
  DefaultBool createModel() => new DefaultBool();
}

@GenSerializer(fields: const {
  'foo': const [
    const DefaultStringValue("1994-03-29T06:00:00Z"),
    const DateTimeProcessor(),
    const EnDecode("f")
  ]
})
class DefaultDate extends Serializer<DefaultDate> with _$DefaultDate {
  DateTime foo;
  String bar;

  DefaultDate({this.foo});

  @override
  DefaultDate createModel() => new DefaultDate();
}

void main() {
  group("Default Value", () {
    test("default value from constructor", () {
      final DefaultValue val = new DefaultValue();
      final decode = val.fromMap({});
      expect(decode.foo, equals("bar"));
      expect(decode.list, equals(["foo", "bar"]));
      expect(decode.bar, isNull);
    });

    test("default String", () {
      final DefaultString str = new DefaultString();
      final decode = str.fromMap({});
      expect(decode.foo, equals("bar"));
      expect(decode.bar, isNull);
    });

    test("default int", () {
      final DefaultInt integer = new DefaultInt();
      final decode = integer.fromMap({});
      expect(decode.foo, equals(42));
      expect(decode.bar, isNull);
    });

    test("default double", () {
      final DefaultDouble dbl = new DefaultDouble();
      final decode = dbl.fromMap({});
      expect(decode.foo, equals(42.42));
      expect(decode.bar, isNull);
    });

    test("default bool", () {
      final DefaultBool boolean = new DefaultBool();
      final decode = boolean.fromMap({});
      expect(decode.foo, isTrue);
      expect(decode.bar, isNull);
    });

    test("default value + processor + rename", () {
      final DefaultDate date = new DefaultDate();
      final decode = date.fromMap({});

      expect(decode.foo is DateTime, isTrue);
      expect(decode.foo, equals(DateTime.parse("1994-03-29T06:00:00Z")));
      expect(decode.bar, isNull);
    });
  });
}
