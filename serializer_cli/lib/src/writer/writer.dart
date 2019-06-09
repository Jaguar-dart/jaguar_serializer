///@nodoc
library jaguar_serializer.generator.writer;

import 'package:jaguar_serializer_cli/src/info/info.dart';
import 'package:jaguar_serializer_cli/src/utils/exceptions.dart';
import 'package:jaguar_serializer_cli/src/utils/string.dart';

part 'to.dart';
part 'from.dart';

class Writer {
  final SerializerInfo info;

  final _w = StringBuffer();

  Writer(this.info);

  String get name => info.name;

  String get modelName => info.modelName;

  String toString() => _w.toString();

  void generate() {
    _w.writeln('abstract class _\$$name implements Serializer<$modelName> {');

    _writeMakers();

    _toWriter();

    _fromWriter();

    _w.writeln('}');
  }

  List<String> _providers = [];

  void _providerWriter(TypeInfo prop) {
    if (prop is SerializedTypeInfo) {
      final fieldName = "_${firstCharToLowerCase(prop.instantiationString)}";
      if (_providers.contains(fieldName)) return;
      _providers.add(fieldName);
      _w.writeln('Serializer<${prop.type}> _$fieldName;');
      _w.writeln(
          'Serializer<${prop.type}> get $fieldName => _$fieldName ??= ${prop.instantiationString}();');
    } else if (prop is ListTypeInfo) {
      _providerWriter(prop.itemInfo);
    } else if (prop is MapTypeInfo) {
      _providerWriter(prop.keyInfo);
      _providerWriter(prop.valueInfo);
    }
  }

  void _writeMakers() {
    {
      List<String> written = [];
      for (Field f in info.fields.values) {
        if (f.processor == null) continue;
        if (f.dontDecode && f.dontDecode) continue;
        final fieldName =
            "_${firstCharToLowerCase(f.processor.instantiationString)}";
        if (!written.contains(fieldName)) {
          written.add(fieldName);
          _w.writeln(
              'final $fieldName = const ${f.processor.instantiationString}();');
        }
      }
    }

    {
      _providers.clear();
      for (Field f in info.fields.values) {
        if (f.dontDecode && f.dontDecode) continue;
        _providerWriter(f.typeInfo);
      }
    }

    if (info.nameFormatter != null) {
      _w.writeln('var _jserNameMapping = <String, String> {');
      for (Field f in info.fields.values) {
        if (f.dontEncode && f.dontDecode) continue;
        if (f.name != f.encodeTo && f.name != f.decodeFrom) continue;
        _w.writeln("'${f.name}': ${info.nameFormatter}('${f.name}'),");
      }
      _w.writeln('};');
    }
  }

  void _toWriter() {
    _w.writeln('@override');
    _w.writeln('Map<String, dynamic> toMap($modelName model) {');
    _w.writeln('if(model == null) return null;');
    _w.writeln(r'Map<String, dynamic> ret = <String, dynamic>{};');
    for (Field item in info.fields.values.where((f) => !f.dontEncode)) {
      _w.writeln(ToItemWriter(item, info.nameFormatter != null).generate());
    }
    _w.writeln(r'return ret;');
    _w.writeln(r'}');
  }

  void _fromWriter() {
    _w.writeln('@override');
    _w.writeln('$modelName fromMap(Map map) {');
    _w.writeln(r'if(map == null) return null;');

    _w.write("final obj = ");
    _writeCtor();
    _w.writeln(';');

    for (Field item in info.fields.values) {
      if (item.dontDecode) continue;
      if (item.isFinal) continue;
      _w.write('obj.${item.name} = ');
      _w.write(
          FromItemWriter(item, info.nameFormatter != null).generate(false));
      _w.write(';');
    }

    _w.writeln(r'return obj;');
    _w.writeln(r'}');
  }

  void _writeCtor() {
    _w.write('$modelName(');
    bool first = true;
    info.ctorArguments.forEach((CtorArgument param) {
      if (!first) _w.write(',');
      first = false;

      if (!param.canSerialize) {
        _w.write("getJserDefault('${param.name}')");
        return;
      }
      _w.write(
          FromItemWriter(info.fields[param.name], info.nameFormatter != null)
              .generate(true));
    });
    info.ctorNamedArguments.forEach((param) {
      if (!first) _w.write(',');
      first = false;
      _w.write('${param.name}: ');
      _w.write(FromItemWriter(
              info.fields[param.displayName], info.nameFormatter != null)
          .generate(true));
    });
    _w.write(')');
  }
}
