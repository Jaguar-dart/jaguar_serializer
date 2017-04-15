///@nodoc
import 'dart:async';
import 'dart:io';

import 'package:build_runner/build_runner.dart' as build_runner;
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen_help/source_gen_help.dart';

import 'package:jaguar_serializer/serializer.dart';
import 'package:jaguar_serializer/src/generator/phase/phase.dart';
import 'package:jaguar_serializer/src/generator/parser/import.dart';
import 'package:jaguar_serializer/src/generator/writer/writer.dart';
import 'package:jaguar_serializer/src/generator/config/config.dart';

/// Watch files and trigger build function
Stream<build_runner.BuildResult> watch() =>
    build_runner.watch(phaseGroup(), deleteFilesByDefault: true);

/// Build all Serializer
Future<build_runner.BuildResult> build() =>
    build_runner.build(phaseGroup(), deleteFilesByDefault: true);

/// Create Serializer Config File
init() {
  final pubspec = new File("pubspec.yaml");
  if (!pubspec.existsSync()) {
    stderr.writeln("Error: 'pubspec.yaml' not found.");
  } else {
    final configFile = new File(jaguarSerializerConfigFile);
    if (configFile.existsSync()) {
      stderr.writeln("Error: '$jaguarSerializerConfigFile' already exist.");
    } else {
      configFile.writeAsStringSync('''
serializers:
# Add files with your serializable class here.
#- lib/models/my_model.dart
      ''');
    }
  }
}

String get _usage => '''
Available commands:
  - build
  - watch
''';

// shoud we keep this ?
start(List<String> args) {
  if (args.length > 0) {
    if (args[0] == 'watch') {
      return watch();
    } else if (args[0] == 'build') {
      return build();
    } else if (args[0] == 'init') {
      return init();
    }
  }
  print(_usage);
}

/// source_gen hook to generate serializer
class SerializerGenerator extends GeneratorForAnnotation<GenSerializer> {
  const SerializerGenerator();

  /// This method is called when build finds an element with
  /// [GenSerializer] annotation.
  ///
  /// [element] is the element annotated with [Api]
  /// [api] is an instantiation of the [Api] annotation
  @override
  Future<String> generateForAnnotatedElement(
      Element element, GenSerializer api, BuildStep buildStep) async {
    if (element is! ClassElement) {
      throw new Exception(
          "GenSerializer annotation can only be defined on a class.");
    }

    ClassElement classElement = element;
    String className = classElement.name;

    print("Generating serializer for $className ...");

    SerializerInfo info = parseSerializer(new ClassElementWrap(classElement));
    info.typeInfo = api.typeInfo;
    info.modelName = api.modelName;

    SerializerWriter writer =
        new SerializerWriter(new SerializerWriteInfo.FromInfo(info));

    writer.generate();

    return writer.toString();
  }
}
