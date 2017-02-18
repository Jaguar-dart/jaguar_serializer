library serializer.test.benchmark;

import 'dart:io';
import 'dart:convert';
import 'package:jaguar_serializer/serializer.dart';

part "benchmark.g.dart";

@GenSerializer()
class TestSerializer extends MapSerializer<Test> with _$TestSerializer {
  @override
  Test createModel() => new Test();
}

@GenSerializer()
class InnerTestSerializer extends MapSerializer<InnerTest> with _$InnerTestSerializer {
  @override
  InnerTest createModel() => new InnerTest();
}

class Test {
  String name = "test";
  num number;
  List<String> names = [ "jaguar", "serializer", "test"];
  List<num> numbers = [];
  List<InnerTest> inner = [];

  Test({this.number, int it}) {
    if (it != null) {
      for (int i = 0; i < it / 2; i++) {
        numbers.add(i);
      }
      for (int i = 0; i < it / 2; i++) {
        inner.add(new InnerTest());
      }
    }
  }
}

class InnerTest {
  String name = "innerTest";
  List<String> names = [ "jaguar", "serializer", "test", "inner"];
}

const num maxIteration = 250;
Serializer json = new SerializerJson();


main() {
  JaguarSerializer.addSerializer(new TestSerializer());
  JaguarSerializer.addSerializer(new InnerTestSerializer());
  File jsonFile = new File("benchmark_result.csv");
  if (jsonFile.existsSync() == false) {
    jsonFile.createSync();
  }

  jsonFile.writeAsStringSync("");
  for (int it = 0; it < maxIteration; it++) {
    List<Test> tests = [];
    for (int i = 0; i < it; i++) {
      tests.add(new Test(number: i, it: it));
    }

    Stopwatch time;
    List<num> times = [it];

    time = new Stopwatch()
      ..start();
    String encoded = json.encode(tests);
    times.add(time.elapsedMilliseconds);

    time = new Stopwatch()
      ..start();
    json.decode(encoded, type: Test);
    times.add(time.elapsedMilliseconds);

    time = new Stopwatch()
      ..start();
    JSON.decode(encoded);
    times.add(time.elapsedMilliseconds);


    jsonFile.writeAsStringSync("${times.join(",")}\n", mode: FileMode.APPEND);
  }
}