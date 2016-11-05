library jaguar_serializer.generator.writer;

import 'package:jaguar_serializer/generator/parser/serializer_parser/serializer_parser.dart';

class SerializerWriter {
  final SerializerWriteInfo info;

  StringBuffer _w = new StringBuffer();

  SerializerWriter(this.info);

  String toString() => _w.toString();

  void generate() {
    _w.writeln(
        r'abstract class _$' + info.name + r' implements MapSerializer {');
    _w.writeln('${info.modelName} get model;');
    _w.writeln();

    _toWriter();

    _fromWriter();

    _w.writeln('}');
  }

  void _toWriter() {
    _w.writeln(r'Map toMap() {');
    _w.writeln(r'Map ret = new Map();');

    for (ToField item in info.to) {
      _toItemWriter(item);
    }

    _w.writeln(r'return ret;');
    _w.writeln(r'}');
  }

  void _toItemWriter(ToField item) {
    //TODO implement List, Set
    //TODO implement Map
    if (item is ToFieldNormal) {
      _w.writeln('ret["${item.key}"] = model.${item.name};');
    } else if (item is ToFieldSerialized) {
      _w.write('ret["${item.key}"] = new ');
      _w.write(item.serializer.displayName);
      _w.writeln('(model.${item.name}).toMap();');
    } else if (item is ToFieldCustom) {
      _w.write('ret["${item.key}"] = new ');
      _w.write(item.instantiationString);
      _w.writeln('.to(model.${item.name});');
    }
  }

  /* TODO
  void _toListWriter(ToField item) {
    //TODO
  }
  */

  void _fromWriter() {
    _w.writeln(r'void fromMap(Map map) {');
    _w.writeln(r'if(map is! Map) {');
    _w.writeln(r'return;');
    _w.writeln(r'}');

    for (FromField item in info.from) {
      _fromItemWriter(item);
    }

    _w.writeln(r'}');
  }

  void _fromItemWriter(FromField item) {
    //TODO implement List, Set
    //TODO implement Map
    if (item is FromFieldNormal) {
      _w.writeln('model.${item.name} = map["${item.key}"];');
    } else if (item is FromFieldSerialized) {
      _w.write('model.${item.name} = (new ');
      _w.write(item.serializer.displayName);
      _w.writeln(
          '(new ${item.type.displayName}())..fromMap(map["${item.key}"])).model;');
    } else if (item is FromFieldCustom) {
      _w.write('model.${item.name} = new ');
      _w.write(item.instantiationString);
      _w.writeln('.from(map["${item.key}"]);');
    }
  }
}
