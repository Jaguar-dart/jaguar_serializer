library serializer.yaml;

import 'package:jaguar_serializer/src/serializer/import.dart';
import 'package:yaml/yaml.dart';
import 'package:yamlicious/yamlicious.dart';

class SerializerYaml extends Serializer {
  SerializerYaml()
      : super((dynamic object) => toYamlString(convertKeysToString(object)),
            (String data) => loadYaml(data));
}
