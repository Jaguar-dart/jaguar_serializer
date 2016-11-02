library jaguar_serializer.generator.parser.serializer;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/src/annotation.dart';

void parseSerializer(ClassElement clazz) {
  clazz.allSupertypes.forEach((InterfaceType type) {
    print(type.element);
  });
  //TODO
}