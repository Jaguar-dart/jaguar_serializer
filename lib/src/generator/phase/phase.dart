///@nodoc
library jaguar.generator.phase;

import 'dart:io';
import 'package:build_runner/build_runner.dart';
import 'package:source_gen/source_gen.dart';

import 'package:jaguar_serializer/src/generator/generator.dart';
import 'package:jaguar_serializer/src/generator/config/config.dart';

Phase apisPhase(String projectName, List<String> apis) {
  return new Phase()
    ..addAction(
        new GeneratorBuilder(const [
          const SerializerGenerator(),
        ]),
        new InputSet(projectName, apis));
}

PhaseGroup generatePhaseGroup({String projectName, List<String> apis}) {
  final phaseGroup = new PhaseGroup();
  phaseGroup.addPhase(apisPhase(projectName, apis));
  return phaseGroup;
}

PhaseGroup phaseGroup({String configFileName: jaguarSerializerConfigFile}) {
  final defaultPath = [
    "lib/**/**.dart",
    "bin/**/**.dart",
    "test/**/**.dart",
    "example/**/**.dart",
    "lib/*.dart",
    "bin/*.dart",
    "test/*.dart",
    "example/*.dart"
  ];
  var config;
  try {
    config = new JaguarSerializerConfig(configFileName: configFileName);
  } on FileSystemException catch (_) {
    print(
        "[WARNING] Jaguar Serializer: 'serializer.yaml' not found, '$defaultPath' used by default");
    config = new DefaultGeneratorConfig(defaultPath);
  }

  if (config.pubspec.projectName == null) {
    throw "Could not find the project name";
  }

  if (config.serializers == null) {
    print(
        "[WARNING] Jaguar Serializer: You need to provide one or more api file, '$defaultPath' used by default");
  }

  return generatePhaseGroup(
      projectName: config.pubspec.projectName, apis: config.serializers);
}
