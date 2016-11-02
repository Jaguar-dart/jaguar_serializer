library jaguar_serializer.generator.hook.make_serializer;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

import 'package:jaguar_serializer/serializer.dart';

import 'package:jaguar_serializer/generator/parser/import.dart';
import 'package:jaguar_serializer/generator/writer/import.dart';

/// source_gen hook to generate serializer
class SerializerGenerator extends GeneratorForAnnotation<GenSerializer> {
  const SerializerGenerator();

  /// This method is called when build finds an element with
  /// [GenSerializer] annotation.
  ///
  /// [element] is the element annotated with [Api]
  /// [api] is an instantiation of the [Api] annotation
  @override
  Future<String> generateForAnnotatedElement(
      Element element, GenSerializer api, BuildStep buildStep) async {
    if (element is! ClassElement) {
      throw new Exception("GenSerializer annotation can only be defined on a class.");
    }

    ClassElement classElement = element;
    String className = classElement.name;

    String model; //TODO get this

    print("Generating serializer $className for model $model ...");

    parseSerializer(classElement);  //TODO

    Writer writer = new Writer(className);

    return writer.toString();
  }
}