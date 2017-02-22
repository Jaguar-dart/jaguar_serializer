library jaguar_serializer.yaml;

import 'package:jaguar_serializer/serializer.dart';
import 'package:yaml/yaml.dart';
import 'package:yamlicious/yamlicious.dart';

class YamlRepo extends SerializerRepo {
  YamlRepo({String typeInfoKey: "@t"}) : super(typeInfoKey: typeInfoKey);

  dynamic encode(dynamic object) => toYamlString(object);

  dynamic decode(dynamic object) => loadYaml(object);
}
