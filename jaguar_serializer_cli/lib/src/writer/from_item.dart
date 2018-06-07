part of jaguar_serializer.generator.writer;

/* TODO
class FromItemWriter {
  final FieldFrom field;

  FromItemWriter(this.field);

  String writeFromListProperty(String reference, ListPropertyFrom prop,
      [String defaultValueRef]) {
    StringBuffer _w = new StringBuffer();

    final outputTypeStr = prop.itemTypeStr;

    if (field.nullable) {
      _w.write("nullableIterableMapper");
    } else {
      _w.write("nonNullableIterableMapper");
    }

    if (outputTypeStr != null) {
      _w.write('<$outputTypeStr>');
    }

    _w.write('($reference as Iterable,');
    _w.write('(val) => ');
    _w.write(writeFromProperty('val', prop.value, null, castValue: true));
    if (!field.nullable) {
      if (defaultValueRef != null) {
        _w.writeln(", $defaultValueRef");
      } else {
        _w.writeln(", <${outputTypeStr ?? 'dynamic'}>[]");
      }
    }
    _w.write(')');

    return _w.toString();
  }

  String writeFromMapProperty(String reference, MapPropertyFrom map,
      [String defaultValueRef]) {
    StringBuffer _w = new StringBuffer();

    final outputTypeStr = map.valueTypeStr;

    if (field.nullable) {
      _w.write('nullableMapMaker');
    } else {
      _w.write('nonNullableMapMaker');
    }

    if (outputTypeStr != null) {
      _w.write('<$outputTypeStr>');
    }

    _w.write('($reference as Map<String, dynamic>,');
    _w.write('(val) =>');
    _w.write(writeFromProperty('val', map.value, null, castValue: true));
    if (!field.nullable) {
      if (defaultValueRef != null) {
        _w.writeln(", $defaultValueRef");
      } else {
        _w.writeln(", <String, ${outputTypeStr ?? 'dynamic'}>{}");
      }
    }
    _w.write(')');

    return _w.toString();
  }

  String writeFromLeafProperty(
      String reference, LeafPropertyFrom leaf, String defaultValueRef,
      {bool castValue: false}) {
    StringBuffer _w = new StringBuffer();

    if (leaf is BuiltinLeafPropertyFrom) {
      _w.write(reference);
      if (castValue == true) {
        _w.write(" as ${leaf.inputTypeStr}");
      }
    } else if (leaf is CustomPropertyFrom) {
      _w.write("_${firstCharToLowerCase(leaf.instantiationString)}" +
          '.deserialize($reference');
      if (castValue == true && leaf.serializedType != "dynamic") {
        _w.write(" as ${leaf.serializedType}");
      }
      _w.write(")");
    } else if (leaf is SerializedPropertyFrom) {
      _w.write("_${firstCharToLowerCase(leaf.instantiationString)}" +
          '.fromMap($reference as Map<String, dynamic>)');
    }
    if (defaultValueRef != null) {
      _w.writeln("?? $defaultValueRef");
    }
    return _w.toString();
  }

  String writeFromProperty(
      String reference, PropertyFrom prop, String defaultValueRef,
      {bool castValue: false}) {
    if (prop is ListPropertyFrom) {
      return writeFromListProperty(reference, prop, defaultValueRef);
    } else if (prop is MapPropertyFrom) {
      return writeFromMapProperty(reference, prop, defaultValueRef);
    } else if (prop is LeafPropertyFrom) {
      return writeFromLeafProperty(reference, prop, defaultValueRef,
          castValue: castValue);
    } else {
      throw new JaguarCliException('Dont know how to handle this!');
    }
  }

  String generate(String reference, [String defaultValueRef]) {
    return writeFromProperty(reference, field.property, defaultValueRef,
        castValue: true);
  }
}
*/
