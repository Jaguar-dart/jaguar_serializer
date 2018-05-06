import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'default_value.jser.dart';

@GenSerializer(fields: const {
  'foo': const Property<String>(valueFromConstructor: true),
  "list": const Property<List<String>>(valueFromConstructor: true)
})
class DefaultValue extends Serializer<DefaultValue> with _$DefaultValue {
  String foo;
  String bar;
  List<String> list;

  DefaultValue({this.foo: "bar", this.list: const ["foo", "bar"]});
}

@GenSerializer(fields: const {'foo': const Property<String>(defaultsTo: "bar")})
class DefaultString extends Serializer<DefaultString> with _$DefaultString {
  String foo;
  String bar;

  DefaultString({this.foo});
}

@GenSerializer(fields: const {'foo': const Property<int>(defaultsTo: 42)})
class DefaultInt extends Serializer<DefaultInt> with _$DefaultInt {
  int foo;
  String bar;

  DefaultInt({this.foo});
}

@GenSerializer(fields: const {'foo': const Property<double>(defaultsTo: 42.42)})
class DefaultDouble extends Serializer<DefaultDouble> with _$DefaultDouble {
  double foo;
  String bar;

  DefaultDouble({this.foo});
}

@GenSerializer(fields: const {'foo': const Property<bool>(defaultsTo: true)})
class DefaultBool extends Serializer<DefaultBool> with _$DefaultBool {
  bool foo;
  String bar;

  DefaultBool({this.foo});
}

/* @GenSerializer(fields: const {
  'foo': const EnDecode(
      alias: 'f',
      processor: const DateTimeProcessor())
})
class DefaultDate extends Serializer<DefaultDate> with _$DefaultDate {
  DateTime foo;
  String bar;

  DefaultDate({this.foo});

  @override
  DefaultDate createModel() => new DefaultDate();
} */
