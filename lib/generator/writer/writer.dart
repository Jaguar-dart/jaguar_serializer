library jaguar_serializer.generator.writer;

import 'package:jaguar_serializer/generator/parser/serializer_parser/serializer_parser.dart';
//TODO import 'package:jaguar_serializer/generator/parser/model_parser/model_parser.dart';

class SerializerWriter {
  final SerializerWriteInfo info;

  StringBuffer _w = new StringBuffer();

  SerializerWriter(this.info);

  String toString() => _w.toString();

  void generate() {
    _w.writeln(r'abstract class _$' + info.name + r'{');
    _w.writeln('User get model;');

    _toWriter();

    _fromWriter();

    _w.writeln('}');
  }

  void _toWriter() {
    _w.writeln(r'Map toMap() {');
    _w.writeln(r'Map ret = new Map();');

    for(ToField item in info.to) {
      _toItemWriter(item);
    }

    _w.writeln(r'return ret;');
    _w.writeln(r'}');
  }

  void _toItemWriter(ToField item) {
    //TODO handle non builtin type
    //TODO handle objects
    //TODO handle custom encoders
    //TODO implement List, Set
    //TODO implement Map
    _w.writeln('ret["${item.key}"] = model.${item.name};');
  }

  void _toListWriter(ToField item) {

  }

  void _fromWriter() {
    _w.writeln(r'void fromMap(Map map) {');
    _w.writeln(r'if(map is! Map) {');
    _w.writeln(r'return;');
    _w.writeln(r'}');

    for(FromField item in info.from) {
      _fromItemWriter(item);
    }

    _w.writeln(r'}');
  }

  void _fromItemWriter(FromField item) {
    //TODO handle non builtin type
    //TODO handle objects
    //TODO handle custom encoders
    //TODO implement List, Set
    //TODO implement Map
    _w.writeln('model.${item.name} = map["${item.key}"];');
  }
}