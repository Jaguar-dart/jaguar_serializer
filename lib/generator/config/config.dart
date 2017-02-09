import 'package:jaguar_generator_config/jaguar_generator_config.dart';

const String jaguarSerializerConfigFile = "serializer.yaml";

class JaguarSerializerConfig extends GeneratorConfig {
  static const String serializersKey = 'serializers';

  JaguarSerializerConfig({String configFileName: jaguarSerializerConfigFile})
      : super(configFileName: configFileName);

  List<String> get serializers => config[serializersKey];
}
