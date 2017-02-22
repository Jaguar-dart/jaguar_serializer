part of jaguar_serializer.generator.writer;

class FromItemWriter {
  PropertyFrom _property;

  FromItemWriter(this._property);

  String writeFromListProperty(String reference, ListPropertyFrom prop) {
    StringBuffer _w = new StringBuffer();

    _w.write(reference);
    _w.write('?.map((${prop.value.inputTypeStr} val) => ');
    _w.write(writeFromProperty('val', prop.value));
    _w.write(')?.toList()');

    return _w.toString();
  }

  String writeFromMapProperty(String reference, MapPropertyFrom map) {
    StringBuffer _w = new StringBuffer();
    _w.write('new MapMaker');
    _w.write('(');
    _w.write(reference);
    _w.write(',');
    _w.write('(${map.key.inputTypeStr} key) => key,');
    _w.write('(${map.value.inputTypeStr} value) {');
    _w.write('return ');
    _w.write(writeFromProperty('value', map.value));
    _w.write(';}).model as dynamic');

    return _w.toString();
  }

  String writeFromLeafProperty(String reference, LeafPropertyFrom leaf) {
    StringBuffer _w = new StringBuffer();

    if (leaf is BuiltinLeafPropertyFrom) {
      _w.write(reference);
    } else if (leaf is CustomPropertyFrom) {
      _w.write(' new ' + leaf.instantiationString + '.from($reference)');
    } else if (leaf is SerializedPropertyFrom) {
      _w.write('from' +
          leaf.instantiationString +
          '.fromMap($reference, typeInfoKey: typeInfoKey)');
    }
    /*else if (leaf is ProviderPropertyFrom) {
      _w.write(' SerializerRepo.getSerializerForType(' +
          leaf.type +
          ').fromMap($reference)');
    }*/
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
