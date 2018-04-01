part of jaguar_serializer.generator.writer;

class ToItemWriter {
  final FieldTo field;

  ToItemWriter(this.field);

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
    _w.write(writeToProperty('val', prop.value, castValue: true));
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
    _w.write(writeToProperty('val', map.value, castValue: true));

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
      _w.write(', withType: withType, typeKey: typeKey)');
    }

    return _w.toString();
  }

  String writeToProperty(String reference, PropertyTo prop,
      {bool castValue: false}) {
    if (prop is ListPropertyTo) {
      return writeToListProperty(reference, prop, castReference: castValue);
    } else if (prop is MapPropertyTo) {
      return writeToMapProperty(reference, prop, castReference: castValue);
    } else if (prop is LeafPropertyTo) {
      return writeToLeafProperty(reference, prop, castValue: castValue);
    } else {
      throw new JaguarCliException('Dont know how to handle this!');
    }
  }

  String generate(String reference) {
    return writeToProperty(reference, field.property);
  }
}
