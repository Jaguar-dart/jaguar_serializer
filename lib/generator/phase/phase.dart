library jaguar.generator.phase;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:jaguar_serializer/generator/hook/make_serializer/make_serializer.dart';
import 'package:jaguar_serializer/generator/config/config.dart';

Phase apisPhase(String projectName, List<String> apis) {
  return new Phase()
    ..addAction(
        new GeneratorBuilder(const [
          const SerializerGenerator(),
        ]),
        new InputSet(projectName, apis));
}

PhaseGroup generatePhaseGroup({String projectName, List<String> apis}) {
  PhaseGroup phaseGroup = new PhaseGroup();
  phaseGroup.addPhase(apisPhase(projectName, apis));
  return phaseGroup;
}

PhaseGroup phaseGroup({String configFileName: jaguarSerializerConfigFile}) {
  JaguarSerializerConfig config =
      new JaguarSerializerConfig(configFileName: configFileName);
  if (config.pubspec.projectName == null) {
    throw "Could not find the project name";
  }

  if (config.serializers == null) {
    throw "You need to provide one or more api file";
  }

  return generatePhaseGroup(
      projectName: config.pubspec.projectName, apis: config.serializers);
}
