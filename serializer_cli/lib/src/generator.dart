///@nodoc
import 'dart:async';

import 'package:analyzer/dart/element/element.dart';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';

import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'info/info.dart';
import 'instantiater/instantiater.dart';
import 'writer/writer.dart';
import 'utils/exceptions.dart';

final Logger _log = Logger("JaguarSerializer");

/// source_gen hook to generate serializer
class JaguarSerializerGenerator extends GeneratorForAnnotation<GenSerializer> {
  const JaguarSerializerGenerator();

  final _onlyClassMsg =
      "GenSerializer annotation can only be defined on a class.";

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) throw JCException(_onlyClassMsg);

    try {
      SerializerInfo info =
          AnnotationParser(element as ClassElement, annotation).parse();

      // TODO check info validity
      // for example valueFromConstructor == true && isNullable == false is not possible

      final writer = Writer(info);

      writer.generate();
      return writer.toString();
    } on Exception catch (e, s) {
      _log.severe(e);
      _log.severe(s);
      return "// $e \n\n";
    }
  }
}

Builder jaguarSerializerPartBuilder({String header}) => PartBuilder(
      [JaguarSerializerGenerator()],
      '.jser.dart',
      header: header,
    );
