library jaguar.generator.config;

import 'dart:io';
import 'package:yaml/yaml.dart';

class SerializerConfig {
  static const String config_folder = "./jaguar";
  static const String config_file = "$config_folder/serializer.yaml";
  static const String pubspec_file = "./pubspec.yaml";
  static const String project_name_key = "name";
  static const String annotations_key = 'serializers';

  static SerializerConfig _instance;

  Map pubspec;
  Map config;

  String get projectName => pubspec[project_name_key];
  List<String> get annotations => config[annotations_key];

  SerializerConfig._internal() {
    pubspec = loadYaml(new File(pubspec_file).readAsStringSync());
    config = loadYaml(new File(config_file).readAsStringSync());
  }

  factory SerializerConfig() => _instance ??= new SerializerConfig._internal();
}

SerializerConfig serializer_config = new SerializerConfig();