library jaguar_serializer.yaml;

import 'package:jaguar_serializer/serializer.dart';
import 'package:yaml/yaml.dart';
import 'package:yamlicious/yamlicious.dart';

class SerializerYaml extends Serializer {
  SerializerYaml()
      : super((dynamic object) => toYamlString(object),
            (String data) => loadYaml(data));
}
