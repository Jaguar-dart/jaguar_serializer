///@nodoc
import 'dart:async';

import 'package:analyzer/dart/element/element.dart';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';

import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'helpers/helpers.dart';
import 'parser/parser.dart';
import 'writer/writer.dart';

final Logger _log = new Logger("SerializerGenerator");

/// source_gen hook to generate serializer
class JaguarSerializerGenerator extends GeneratorForAnnotation<GenSerializer> {
  const JaguarSerializerGenerator();

  final _onlyClassMsg =
      "GenSerializer annotation can only be defined on a class.";

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement) throw new JaguarCliException(_onlyClassMsg);

    try {
      final instantiator =
          new AnnotationParser(element as ClassElement, annotation);
      final info = instantiator.parse();

      // todo check info validity
      // for example valueFromConstructor == true && isNullable == false is not possible

      final writerInfo = new WriterInfo.fromInfo(info);

      final writer = new Writer(writerInfo);

      writer.generate();
      return writer.toString();
    } on JaguarCliException catch (e) {
      _log.severe(e.toString());
      return "// $e";
    }
  }
}

Builder jaguarSerializerPartBuilder({String header}) =>
    new PartBuilder([new JaguarSerializerGenerator()], header: header);
