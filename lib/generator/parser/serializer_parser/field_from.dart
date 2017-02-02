part of jaguar_serializer.generator.parser.serializer;

class FieldFrom {
  PropertyFrom property;

  String key;

  String name;

  FieldFrom(this.key, this.name, this.property);
}

abstract class PropertyFrom {
  String get inputTypeStr;
}

class MapPropertyFrom implements PropertyFrom {
  final PropertyFrom key;

  final PropertyFrom value;

  final String keyTypeStr;

  final String valueTypeStr;

  String get inputTypeStr => 'Map<${key.inputTypeStr}, ${value.inputTypeStr}>';

  const MapPropertyFrom(
      this.key, this.keyTypeStr, this.value, this.valueTypeStr);
}

class ListPropertyFrom implements PropertyFrom {
  final PropertyFrom value;

  final String itemTypeStr;

  String get inputTypeStr => 'List<${value.inputTypeStr}>';

  const ListPropertyFrom(this.value, this.itemTypeStr);
}

abstract class LeafPropertyFrom implements PropertyFrom {}

class BuiltinLeafPropertyFrom implements LeafPropertyFrom {
  final String inputTypeStr;

  const BuiltinLeafPropertyFrom(this.inputTypeStr);
}

class CustomPropertyFrom implements LeafPropertyFrom {
  final String instantiationString;

  String get inputTypeStr => 'dynamic';

  const CustomPropertyFrom(this.instantiationString);
}

class SerializedPropertyFrom implements LeafPropertyFrom {
  final String instantiationString;

  String get inputTypeStr => 'Map';

  const SerializedPropertyFrom(this.instantiationString);
}

class ProviderPropertyFrom implements LeafPropertyFrom {
  final String type;

  String get inputTypeStr => 'dynamic';

  const ProviderPropertyFrom(this.type);
}

PropertyFrom _parsePropertyFrom(SerializerInfo info, DartTypeWrap type) {
  if (type.isDynamic) {
    throw new Exception('Cannot serialize dynamic type!');
  } else if (type.isObject) {
    throw new Exception('Cannot serialize Object type!');
  }

  if (type.isList) {
    List<DartTypeWrap> params = type.typeArguments;
    if (params.length != 1) {
      throw new Exception('List should have exactly one type parameter!');
    }

    DartTypeWrap param = params[0];

    return new ListPropertyFrom(
        _parsePropertyFrom(info, param), param.displayName);
  } else if (type.isMap) {
    List<DartTypeWrap> params = type.typeArguments;

    if (params.length != 2) {
      throw new Exception('Map should have exactly two type parameter!');
    }

    //TODO key should be only builtin?

    DartTypeWrap key = params[0];
    DartTypeWrap value = params[1];

    return new MapPropertyFrom(_parsePropertyFrom(info, key), key.displayName,
        _parsePropertyFrom(info, value), value.displayName);
  } else if (type.isBuiltin) {
    return new BuiltinLeafPropertyFrom(type.displayName);
  } else {
    DartTypeWrap ser;

    info.serializationProviders
        .forEach((DartTypeWrap modelType, DartTypeWrap serializer) {
      if (type.compareNamedElement(modelType)) {
        ser = serializer;
      }
    });

    if (ser is! DartTypeWrap) {
      return new ProviderPropertyFrom(type.displayName);
    }

    return new SerializedPropertyFrom(ser.displayName);
  }
}

FieldFrom _parseFieldFrom(SerializerInfo info, ModelField field, String key) {
  if (info.customFieldCodecs.containsKey(field.name)) {
    String instStr = info.customFieldCodecs[field.name].instantiationString;
    return new FieldFrom(key, field.name, new CustomPropertyFrom(instStr));
  } else {
    return new FieldFrom(key, field.name, _parsePropertyFrom(info, field.type));
  }
}
