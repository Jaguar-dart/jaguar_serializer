part of jaguar_serializer.generator.writer;

class FromItemWriter {
  final Field field;

  FromItemWriter(this.field);

  String _makeList(String reference, ListTypeInfo prop) {
    var _w = new StringBuffer();

    final outputTypeStr = prop.itemTypeStr;

    if (field.isNullable) {
      _w.write("nullableIterableMapper");
    } else {
      _w.write("nonNullableIterableMapper");
    }

    if (outputTypeStr != null) {
      _w.write('<$outputTypeStr>');
    }

    _w.write('($reference as Iterable,');
    _w.write('(val) => ');
    _w.write(_makeValue('val', prop.value, cast: true));
    if (!field.isNullable) _w.writeln(", <${outputTypeStr ?? 'dynamic'}>[]");
    _w.write(')');

    return _w.toString();
  }

  String _makeMap(String reference, MapTypeInfo map) {
    StringBuffer _w = new StringBuffer();

    final outputTypeStr = map.valueTypeStr;

    if (field.isNullable) {
      _w.write('nullableMapMaker');
    } else {
      _w.write('nonNullableMapMaker');
    }

    if (outputTypeStr != null) {
      _w.write('<$outputTypeStr>');
    }

    _w.write('($reference as Map<String, dynamic>,');
    _w.write('(val) =>');
    _w.write(_makeValue('val', map.value, cast: true));
    if (!field.isNullable)
      _w.writeln(", <String, ${outputTypeStr ?? 'dynamic'}>{}");
    _w.write(')');

    return _w.toString();
  }

  String _makeValue(String reference, TypeInfo prop, {bool cast: false}) {
    if (prop is BuiltinTypeInfo) {
      return reference + (cast ? ' as ${prop.typeStr}' : '');
    } else if (prop is ProcessedTypeInfo) {
      var w = new StringBuffer();
      w.write("_${firstCharToLowerCase(prop.instantiationString)}" +
          '.deserialize($reference');
      if (cast == true && prop.serializedType != "dynamic") {
        w.write(" as ${prop.serializedType}");
      }
      w.write(")");
      return w.toString();
    } else if (prop is SerializedTypeInfo) {
      return "_${firstCharToLowerCase(prop.instantiationString)}" +
          '.fromMap($reference as Map<String, dynamic>)';
    } else if (prop is ListTypeInfo) {
      return _makeList(reference, prop);
    } else if (prop is MapTypeInfo) {
      return _makeMap(reference, prop);
    }
    throw new JCException('Dont know how to handle this!');
  }

  String generate() {
    String defVal;
    if (field.defaultValue != null) {
      defVal = field.defaultValue;
    } else if (field.fromConstructor) {
      defVal = "obj.${field.name}";
    }
    return _makeValue("map['${field.decodeFrom}']", field.typeInfo,
            cast: true) +
        (defVal != null ? ' ?? ${defVal}' : '');
  }
}
