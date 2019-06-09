part of jaguar_serializer.generator.writer;

class ToItemWriter {
  final Field field;

  final bool hasGlobalNameForamtter;

  ToItemWriter(this.field, this.hasGlobalNameForamtter);

  String _makeList(String reference, ListTypeInfo prop, {bool cast: false}) {
    var w = StringBuffer();

    if (field.isNullable) {
      w.write("codeIterable(");
    } else {
      w.write("codeNonNullIterable(");
    }
    w.write("$reference");
    if (cast == true) w.write(" as Iterable");
    w.write(",");

    w.write('(val) => ');
    w.write(_makeValue('val', prop.itemInfo, cast: true));
    if (!field.isNullable) w.write(", []");
    w.write(')');

    return w.toString();
  }

  String _makeMap(String reference, MapTypeInfo map, {bool cast: false}) {
    StringBuffer _w = StringBuffer();

    if (field.isNullable) {
      _w.write('codeMap(');
    } else {
      _w.write('codeNonNullMap(');
    }
    _w.write("$reference");
    if (cast == true) {
      _w.write(" as Map<String, dynamic>");
    }
    _w.write(",");
    _w.write('(val) =>');
    _w.write(_makeValue('val', map.valueInfo, cast: true));

    if (!field.isNullable) _w.write(", <String, dynamic>{}");
    _w.write(')');

    return _w.toString();
  }

  String _makeSet(String reference, SetTypeInfo prop, {bool cast: false}) {
    var w = StringBuffer();

    if (field.isNullable) {
      w.write("codeIterable(");
    } else {
      w.write("codeNonNullIterable(");
    }
    w.write("$reference");
    if (cast == true) w.write(" as Iterable");
    w.write(",");

    w.write('(val) => ');
    w.write(_makeValue('val', prop.itemInfo, cast: true));
    if (!field.isNullable) w.write(", []");
    w.write(')');

    return w.toString();
  }

  String _makeValue(String reference, TypeInfo type, {bool cast: false}) {
    if (type is BuiltinTypeInfo) {
      return reference + (cast ? ' as ${type.typeStr}' : '');
    } else if (type is EnumTypeInfo) {
      return reference + '.index' + (cast ? ' as int' : '');
    } else if (type is ListTypeInfo) {
      return _makeList(reference, type, cast: cast);
    } else if (type is MapTypeInfo) {
      return _makeMap(reference, type, cast: cast);
    } else if (type is SetTypeInfo) {
      return _makeSet(reference, type, cast: cast);
    } else if (type is ProcessedTypeInfo) {
      var w = StringBuffer();
      w.write(type.instantiationString + '.serialize($reference');
      if (cast && type.deserializedType != 'dynamic') {
        w.write(" as ${type.deserializedType}");
      }
      w.write(")");
      if (cast && type.serializedType != 'dynamic') {
        w.write(" as ${type.serializedType}");
      }
      return w.toString();
    } else if (type is SerializedTypeInfo) {
      var w = StringBuffer();
      w.write(
          "_${firstCharToLowerCase(type.instantiationString)}.toMap($reference");
      if (cast) {
        w.write(" as ${type.type}");
      }
      w.write(')');
      return w.toString();
    }
    throw JCException('Dont know how to handle this!');
  }

  String generate() {
    var sb = StringBuffer();
    if (field.isNullable) {
      sb.write('setMapValue(ret,');
    } else {
      sb.write('setMapValueIfNotNull(ret,');
    }
    if (hasGlobalNameForamtter && field.name == field.encodeTo) {
      sb.write("_jserNameMapping['${field.name}']");
    } else {
      sb.write("'${field.encodeTo}'");
    }
    sb.write(",");
    sb.write(_makeValue('model.${field.name}', field.typeInfo));
    sb.write(");");
    return sb.toString();
  }
}
