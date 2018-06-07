part of jaguar_serializer.generator.writer;

class ToItemWriter {
  final Field field;

  ToItemWriter(this.field);

  TypeInfo get typeInfo => field.typeInfo;

  String get base => 'model.${field.name}';

  /* TODO
  String writeToListProperty(String reference, ListPropertyTo prop,
      {bool castReference: false}) {
    StringBuffer _w = new StringBuffer();

    if (field.nullable) {
      _w.write("nullableIterableMapper(");
    } else {
      _w.write("nonNullableIterableMapper(");
    }
    _w.write("$reference");
    if (castReference == true) {
      _w.write(" as Iterable");
    }
    _w.write(",");
    _w.write('(val) => ');
    _w.write(_makeValue('val', prop.value, castValue: true));
    if (!field.nullable) {
      _w.write(", []");
    }
    _w.write(')');

    return _w.toString();
  }

  String writeToMapProperty(String reference, MapPropertyTo map,
      {bool castReference: false}) {
    StringBuffer _w = new StringBuffer();

    if (field.nullable) {
      _w.write('nullableMapMaker(');
    } else {
      _w.write('nonNullableMapMaker(');
    }
    _w.write("$reference");
    if (castReference == true) {
      _w.write(" as Map<String, dynamic>");
    }
    _w.write(",");
    _w.write('(val) =>');
    _w.write(_makeValue('val', map.value, castValue: true));

    if (!field.nullable) {
      _w.write(", <String, dynamic>{}");
    }
    _w.write(')');

    return _w.toString();
  }

  String writeToLeafProperty(String reference, LeafPropertyTo leaf,
      {bool castValue: false}) {
    StringBuffer _w = new StringBuffer();
    if (leaf is BuiltinLeafPropertyTo) {
      _w.write(reference);
      if (castValue) {
        _w.write(" as ${leaf.typeStr}");
      }
    } else if (leaf is CustomPropertyTo) {
      _w.write("_${firstCharToLowerCase(leaf.instantiationString)}" +
          '.serialize($reference');
      if (castValue) {
        _w.write(" as ${leaf.deserializedType}");
      }
      _w.write(")");
    } else if (leaf is SerializedPropertyTo) {
      _w.write(
          "_${firstCharToLowerCase(leaf.instantiationString)}.toMap($reference");
      if (castValue) {
        _w.write(" as ${leaf.type}");
      }
      _w.write(')');
    }

    return _w.toString();
  }
  */

  String _makeValue({bool castValue: false}) {
    if (typeInfo == null) {
      return base;
    } else if (typeInfo is ListTypeInfo) {
      // TODO return writeToListProperty(reference, prop, castReference: castValue);
    } else if (typeInfo is MapTypeInfo) {
      // TODO return writeToMapProperty(reference, prop, castReference: castValue);
    } else if (typeInfo is ProcessedTypeInfo) {
      // TODO return writeToLeafProperty(reference, prop, castValue: castValue);
    } else if (typeInfo is SerializedTypeInfo) {
      // TODO return writeToLeafProperty(reference, prop, castValue: castValue);
    }
    throw new JCException('Dont know how to handle this!');
  }

  String generate() {
    var sb = new StringBuffer();
    if (field.isNullable) {
      sb.write('setNullableValue(ret,');
    } else {
      sb.write('setNonNullableValue(ret,');
    }
    sb.write("'${field.encodeTo}',");
    sb.write(_makeValue());
    sb.write(");");
    return sb.toString();
  }
}
