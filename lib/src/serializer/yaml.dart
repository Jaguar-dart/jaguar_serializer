library serializer.yaml;

import 'dart:convert';
import 'package:jaguar_serializer/src/serializer/import.dart';
import 'package:yaml/yaml.dart';
import 'package:yamlicious/yamlicious.dart';

class SerializerYaml extends Serializer {
  SerializerYaml() : super((Object object) => toYamlString(object), (String data) => loadYaml(data));
}
