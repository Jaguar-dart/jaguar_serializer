library jaguar_serializer.yaml;

import 'package:jaguar_serializer/serializer.dart';
import 'package:yaml/yaml.dart';
import 'package:yamlicious/yamlicious.dart';

/**
 * Repository that serialize/deserialize YAML.
 *
 * Same usage as [SerializerRepo]
 */
class YamlRepo extends SerializerRepo {
  YamlRepo({String typeKey: defaultTypeInfoKey}) : super(typeKey: typeKey);

  ///@nodoc
  dynamic encode(dynamic object) => toYamlString(object);

  ///@nodoc
  dynamic decode(dynamic object) => loadYaml(object);

  /**
   * Deserialize a YAML String to an object.
   *
   * [object] can be a YAML String, a [List] of YAML String.
   *
   * See [SerializerRepo.from] for more information.
   */
  @override
  dynamic deserialize(dynamic object, {Type type, String typeKey}) =>
      super.deserialize(object, type: type, typeKey: typeKey);

  /**
   * Serialize an object to a YAML String
   *
   * [object] can be a [List], [Map] or a serializable object.
   *
   * See [SerializerRepo.to] for more information.
   */
  @override
  dynamic serialize(dynamic object, {bool withType: false, String typeKey}) =>
      super.serialize(object, withType: withType, typeKey: typeKey);
}
