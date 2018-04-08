import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'base.g.dart';

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

class CustomModelName {
  String foo;
}

class ModelRenamed {
  String original;

  ModelRenamed([this.original]);
}

class WithIgnore {
  String a;
  String secret;

  WithIgnore([this.a, this.secret]);
}

class ExcludeByDefault {
  String id;

  String name;

  String email;

  int _number;

  int get number => _number;

  set number(int value) {
    _number = value;
  }
}

@GenSerializer(includeByDefault: false, fields: const {
  'id': const EnDecode<String>(alias: 'id'),
  'name': const EnDecode<String>(alias: 'name'),
})
class ExcludeByDefaultCodec extends Serializer<ExcludeByDefault>
    with _$ExcludeByDefaultCodec {}

@GenSerializer()
class ModelIntSerializer extends Serializer<ModelInt>
    with _$ModelIntSerializer {}

@GenSerializer()
class ModelDoubleSerializer extends Serializer<ModelDouble>
    with _$ModelDoubleSerializer {}

@GenSerializer()
class InheritanceSerializer extends Serializer<Inheritance>
    with _$InheritanceSerializer {}

@GenSerializer(
  fields: const {
    'date': const Property<DateTime>(processor: const DateTimeProcessor()),
  },
)
class DateSerializer extends Serializer<Date> with _$DateSerializer {}

@GenSerializer(ignore: const ['secret'])
class WithIgnoreSerializer extends Serializer<WithIgnore>
    with _$WithIgnoreSerializer {}

@GenSerializer(
    fields: const {'original': const EnDecode<String>(alias: 'renamed')})
class ModelRenamedSerializer extends Serializer<ModelRenamed>
    with _$ModelRenamedSerializer {}

@GenSerializer(modelName: "MyCustomModelName")
class CustomModelNameSerializer extends Serializer<CustomModelName>
    with _$CustomModelNameSerializer {}
