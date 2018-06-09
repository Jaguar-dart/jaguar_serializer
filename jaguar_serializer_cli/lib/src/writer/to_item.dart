part of jaguar_serializer.generator.writer;

class ToItemWriter {
  final Field field;

  ToItemWriter(this.field);

  String _makeList(String reference, ListTypeInfo prop, {bool cast: false}) {
    var w = new StringBuffer();

    if (field.isNullable) {
      w.write("nullableIterableMapper(");
    } else {
      w.write("nonNullableIterableMapper(");
    }
    w.write("$reference");
    if (cast == true) w.write(" as Iterable");
    w.write(",");

    w.write('(val) => ');
    w.write(_makeValue('val', prop.value, cast: true));
    if (!field.isNullable) w.write(", []");
    w.write(')');

    return w.toString();
  }

  String _makeMap(String reference, MapTypeInfo map, {bool cast: false}) {
    StringBuffer _w = new StringBuffer();

    if (field.isNullable) {
      _w.write('nullableMapMaker(');
    } else {
      _w.write('nonNullableMapMaker(');
    }
    _w.write("$reference");
    if (cast == true) {
      _w.write(" as Map<String, dynamic>");
    }
    _w.write(",");
    _w.write('(val) =>');
    _w.write(_makeValue('val', map.value, cast: true));

    if (!field.isNullable) _w.write(", <String, dynamic>{}");
    _w.write(')');

    return _w.toString();
  }

  String _makeValue(String reference, TypeInfo type, {bool cast: false}) {
    if (type is BuiltinTypeInfo) {
      return reference + (cast ? ' as ${type.typeStr}' : '');
    } else if (type is ListTypeInfo) {
      return _makeList(reference, type, cast: cast);
    } else if (type is MapTypeInfo) {
      return _makeMap(reference, type, cast: cast);
    } else if (type is ProcessedTypeInfo) {
      var w = new StringBuffer();
      w.write(type.instantiationString + '.serialize($reference');
      if (cast) w.write(" as ${type.deserializedType}");
      w.write(")");
      return w.toString();
    } else if (type is SerializedTypeInfo) {
      var w = new StringBuffer();
      w.write(
          "_${firstCharToLowerCase(type.instantiationString)}.toMap($reference");
      if (cast) {
        w.write(" as ${type.type}");
      }
      w.write(')');
      return w.toString();
    }
    throw new JCException('Dont know how to handle this!');
  }

  String generate() {
    var sb = new StringBuffer();
    if (field.isNullable) {
      sb.write('setMapValue(ret,');
    } else {
      sb.write('setMapValueIfNotNull(ret,');
    }
    sb.write("'${field.encodeTo}',");
    sb.write(_makeValue('model.${field.name}', field.typeInfo));
    sb.write(");");
    return sb.toString();
  }
}
