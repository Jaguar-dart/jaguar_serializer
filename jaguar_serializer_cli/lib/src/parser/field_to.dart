part of jaguar_serializer.generator.parser;

class FieldTo {
  final PropertyTo property;

  final String key;

  final String name;

  final bool nullable;

  FieldTo(this.key, this.name, this.property, this.nullable);
}

abstract class PropertyTo {}

class MapPropertyTo implements PropertyTo {
  final PropertyTo key;

  final String keyTypeStr;

  final PropertyTo value;

  final String valueTypeStr;

  const MapPropertyTo(this.key, this.keyTypeStr, this.value, this.valueTypeStr);
}

class ListPropertyTo implements PropertyTo {
  final PropertyTo value;

  final String itemTypeStr;

  const ListPropertyTo(this.value, this.itemTypeStr);
}

class LeafPropertyTo implements PropertyTo {}

class BuiltinLeafPropertyTo implements LeafPropertyTo {
  final String typeStr;

  const BuiltinLeafPropertyTo(this.typeStr);
}

class CustomPropertyTo implements LeafPropertyTo {
  final String instantiationString;
  final String serializedType;
  final String deserializedType;

  const CustomPropertyTo(
      this.instantiationString, this.serializedType, this.deserializedType);
}

class SerializedPropertyTo implements LeafPropertyTo {
  final String instantiationString;
  final String type;

  const SerializedPropertyTo(this.instantiationString, this.type);
}

PropertyTo _parsePropertyTo(
    SerializerInfo info, String fieldName, DartType type) {
  if (type is InterfaceType && isList.isExactlyType(type)) {
    final param = type.typeArguments.first;
    return new ListPropertyTo(
        _parsePropertyTo(info, fieldName, param), param.displayName);
  } else if (type is InterfaceType && isMap.isExactlyType(type)) {
    final key = type.typeArguments.first;
    final value = type.typeArguments[1];

    if (key.displayName != "String") {
      throw new JaguarCliException(
          'Serializer only support "String" key for a Map of property $fieldName!');
    }
    return new MapPropertyTo(
        _parsePropertyTo(info, fieldName, key),
        key.displayName,
        _parsePropertyTo(info, fieldName, value),
        value.displayName);
  } else if (info.processors.containsKey(fieldName)) {
    final p = info.processors[fieldName];
    return new CustomPropertyTo(
        p.instantiationString, p.serializedType, p.deserializedType);
  } else if (isBuiltin(type)) {
    return new BuiltinLeafPropertyTo(type.displayName);
  } else if (type.isDynamic) {
    throw new JaguarCliException(
        'Cannot serialize "dynamic" type for property $fieldName!');
  } else if (type.isObject) {
    throw new JaguarCliException(
        'Cannot serialize "Object" type for property $fieldName!');
  }
  DartType ser;

  info.providers.forEach((InterfaceType modelType, ClassElement serializer) {
    if (new TypeChecker.fromStatic(type).isExactlyType(modelType)) {
      ser = serializer.type;
    }
  });

  if (ser == null) {
    throw new JaguarCliException(
        "Serializer not found for '${type.displayName} $fieldName' in '${info.modelType}");
  }

  return new SerializedPropertyTo(ser.displayName, type.displayName);
}

FieldTo _parseFieldTo(SerializerInfo info, Field field, String key) {
  bool nullable = info.globalNullableFields;
  if (info.nullableFields.containsKey(field.name)) {
    nullable = info.nullableFields[field.name];
  }

  return new FieldTo(info.fieldFormatter(key), field.name,
      _parsePropertyTo(info, field.name, field.type), nullable);
}
