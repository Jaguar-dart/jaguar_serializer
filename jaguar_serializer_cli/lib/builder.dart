library jaguar_serializer_cli;

import 'package:build/build.dart';
import 'src/generator.dart';

Builder jaguarSerializer(BuilderOptions options) =>
    jaguarSerializerPartBuilder(header: options.config['header'] as String);
