library serializer.test.benchmark;

import 'dart:io';
import 'dart:convert';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part "benchmark.g.dart";

@GenSerializer(serializers: const [InnerTestSerializer])
class ModelTestSerializer extends Serializer<ModelTest>
    with _$ModelTestSerializer {
  @override
  ModelTest createModel() => new ModelTest();
}

@GenSerializer()
class InnerTestSerializer extends Serializer<InnerTest>
    with _$InnerTestSerializer {
  @override
  InnerTest createModel() => new InnerTest();
}

class ModelTest {
  String name = "test";
  num number;
  List<String> names = ["jaguar", "serializer", "test"];
  List<num> numbers = [];
  List<InnerTest> inner = [];

  ModelTest({this.number, int it}) {
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
  List<String> names = ["jaguar", "serializer", "test", "inner"];
}

const num maxIteration = 250;
SerializerRepo json = new JsonRepo();

main() {
  json.add(new ModelTestSerializer());
  json.add(new InnerTestSerializer());
  File jsonFile = new File("benchmark_result.csv");
  if (jsonFile.existsSync() == false) {
    jsonFile.createSync();
  }

  jsonFile.writeAsStringSync("");
  for (int it = 0; it < maxIteration; it++) {
    List<ModelTest> tests = [];
    for (int i = 0; i < it; i++) {
      tests.add(new ModelTest(number: i, it: it));
    }

    Stopwatch time;
    List<num> times = [it];

    time = new Stopwatch()..start();
    String encoded = json.serialize(tests);
    times.add(time.elapsedMilliseconds);

    time = new Stopwatch()..start();
    json.deserialize(encoded, type: ModelTest);
    times.add(time.elapsedMilliseconds);

    time = new Stopwatch()..start();
    JSON.decode(encoded);
    times.add(time.elapsedMilliseconds);

    jsonFile.writeAsStringSync("${times.join(",")}\n", mode: FileMode.APPEND);
  }
}
