part of jaguar_serializer.generator.writer;

class FromItemWriter {
  PropertyFrom _property;

  FromItemWriter(this._property);

  String writeFromListProperty(String reference, ListPropertyFrom prop) {
    StringBuffer _w = new StringBuffer();

    _w.write('(' + reference + ' as List)');
    _w.write('?.map((val) => ');
    _w.write(writeFromProperty('val', prop.value));
    _w.write(')?.toList()');

    return _w.toString();
  }

  String writeFromMapProperty(String reference, MapPropertyFrom map) {
    StringBuffer _w = new StringBuffer();

    _w.write('new MapMaker');
    _w.write('(');
    _w.write(reference);
    _w.write(' as Map,');
    _w.write('(key) => key,');
    _w.write('(value) {');
    _w.write('return ');
    _w.write(writeFromProperty('value', map.value));
    _w.write(';}).model');

    return _w.toString();
  }

  String writeFromLeafProperty(String reference, LeafPropertyFrom leaf) {
    StringBuffer _w = new StringBuffer();

    if (leaf is BuiltinLeafPropertyFrom) {
      _w.write(reference);
    } else if (leaf is CustomPropertyFrom) {
      _w.write(' new ' + leaf.instantiationString + '.from($reference)');
    } else if (leaf is SerializedPropertyFrom) {
      _w.write(' new ' + leaf.instantiationString + '().fromMap($reference)');
    }

    return _w.toString();
  }

  String writeFromProperty(String reference, PropertyFrom prop) {
    if (prop is ListPropertyFrom) {
      return writeFromListProperty(reference, prop);
    } else if (prop is MapPropertyFrom) {
      return writeFromMapProperty(reference, prop);
    } else if (prop is LeafPropertyFrom) {
      return writeFromLeafProperty(reference, prop);
    } else {
      throw new Exception('Dont know how to handle this!');
    }
  }

  String generate(String reference) {
    return writeFromProperty(reference, _property);
  }
}
