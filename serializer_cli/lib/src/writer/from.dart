part of jaguar_serializer.generator.writer;

class FromItemWriter {
  final Field field;

  final bool hasGlobalNameForamtter;

  FromItemWriter(this.field, this.hasGlobalNameForamtter);

  String _makeList(String reference, ListTypeInfo prop) {
    var _w = StringBuffer();

    final outputTypeStr = prop.itemTypeStr;

    if (field.isNullable) {
      _w.write("codeIterable");
    } else {
      _w.write("codeNonNullIterable");
    }

    if (outputTypeStr != null) {
      _w.write('<$outputTypeStr>');
    }

    _w.write('($reference as Iterable,');
    _w.write('(val) => ');
    _w.write(_makeValue('val', prop.itemInfo, cast: true));
    if (!field.isNullable) _w.writeln(", <${outputTypeStr ?? 'dynamic'}>[]");
    _w.write(')');

    return _w.toString();
  }

  String _makeMap(String reference, MapTypeInfo map) {
    StringBuffer _w = StringBuffer();

    final outputTypeStr = map.valueTypeStr;

    if (field.isNullable) {
      _w.write('codeMap');
    } else {
      _w.write('codeNonNullMap');
    }

    if (outputTypeStr != null) {
      _w.write('<$outputTypeStr>');
    }

    _w.write('($reference as Map,');
    _w.write('(val) =>');
    _w.write(_makeValue('val', map.valueInfo, cast: true));
    if (!field.isNullable)
      _w.writeln(", <String, ${outputTypeStr ?? 'dynamic'}>{}");
    _w.write(')');

    return _w.toString();
  }

  String _makeSet(String reference, SetTypeInfo prop) {
    var _w = StringBuffer();

    final outputTypeStr = prop.itemTypeStr;

    if (field.isNullable) {
      _w.write("codeSet");
    } else {
      _w.write("codeNonNullSet");
    }

    if (outputTypeStr != null) {
      _w.write('<$outputTypeStr>');
    }

    _w.write('($reference as Iterable,');
    _w.write('(val) => ');
    _w.write(_makeValue('val', prop.itemInfo, cast: true));
    _w.write(')');

    return _w.toString();
  }

  String _makeValue(String reference, TypeInfo prop, {bool cast: false}) {
    if (prop is BuiltinTypeInfo) {
      return reference + (cast ? ' as ${prop.typeStr}' : '');
    } else if (prop is EnumTypeInfo) {
      return prop.typeStr + '.values[' + reference + ' as int]';
    } else if (prop is ProcessedTypeInfo) {
      var w = StringBuffer();
      w.write(prop.instantiationString + '.deserialize($reference');
      if (cast == true && prop.serializedType != "dynamic") {
        w.write(" as ${prop.serializedType}");
      }
      w.write(")");
      if (prop.deserializedType != prop.respType &&
          prop.respType != 'dynamic') {
        w.write(" as ${prop.respType}");
      }
      return w.toString();
    } else if (prop is SerializedTypeInfo) {
      return "_${firstCharToLowerCase(prop.instantiationString)}" +
          '.fromMap($reference as Map)';
    } else if (prop is ListTypeInfo) {
      return _makeList(reference, prop);
    } else if (prop is MapTypeInfo) {
      return _makeMap(reference, prop);
    } else if (prop is SetTypeInfo) {
      return _makeSet(reference, prop);
    }
    throw JCException('Dont know how to handle this!');
  }

  String generate(bool isCtor) {
    String key = "'${field.decodeFrom}'";
    if (hasGlobalNameForamtter && field.name == field.decodeFrom) {
      key = "_jserNameMapping['${field.name}']";
    }
    String ref = "map[$key]";
    var sb = StringBuffer();
    sb.write(_makeValue(ref, field.typeInfo, cast: true));
    if (!field.isNullable || isCtor)
      sb.write(" ?? getJserDefault('${field.name}')");
    if (!field.isNullable && !isCtor) sb.write(" ?? obj.${field.name}");
    return sb.toString();
  }
}
