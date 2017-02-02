library jaguar.generator.phase;

import 'dart:io';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:yaml/yaml.dart';

import 'package:jaguar_serializer/generator/hook/make_serializer/make_serializer.dart';

String getProjectName() {
  File pubspec = new File('./pubspec.yaml');
  String content = pubspec.readAsStringSync();
  var doc = loadYaml(content);
  return doc['name'];
}

List<String> getAnnotations() {
  File pubspec = new File('serializer/config.yaml');
  String content = pubspec.readAsStringSync();
  Map<String, List<String>> doc = loadYaml(content) as Map<String, List<String>>;
  return doc['serializers'];
}

Phase apisPhase(String projectName, List<String> apis) {
  return new Phase()
    ..addAction(
        new GeneratorBuilder(const [
          const SerializerGenerator(),
        ]),
        new InputSet(projectName, apis));
}

Phase bootstrapPhase(String projectName) {
  return new Phase()
    ..addAction(
        new SerializerBootstrapBuilder(projectName),
        new InputSet(projectName, ["serializer/config.yaml"]));
}

PhaseGroup generatePhaseGroup({String projectName, List<String> apis}) {
  PhaseGroup phaseGroup = new PhaseGroup();
  phaseGroup.addPhase(apisPhase(projectName, apis));
  phaseGroup.addPhase(bootstrapPhase(projectName));
  return phaseGroup;
}

PhaseGroup phaseGroup() {
  String projectName = getProjectName();
  if (projectName == null) {
    throw "Could not find the project name";
  }

  List<String> apis = getAnnotations();
  if (apis == null) {
    throw "You need to provide one or more api file";
  }

  return generatePhaseGroup(projectName: projectName, apis: apis);
}
