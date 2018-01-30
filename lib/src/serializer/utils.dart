import 'field_processor.dart';
import 'serializer.dart';

typedef String KeyMaker<Key>(Key key);
typedef dynamic ValueMaker<Value>(Value value);

Map<String, dynamic> mapMaker<Key, Value>(
    Map map, KeyMaker<Key> keyMaker, ValueMaker<Value> valueMaker) {
  Map<String, dynamic> ret;
  if (map != null) {
    ret = <String, dynamic>{};
    map.forEach((key, value) {
      ret[keyMaker(key)] = valueMaker(value);
    });
  }
  return ret;
}

void setMap(Map<String, dynamic> map, String key, value,
    {Serializer serializer,
    FieldProcessor processor,
    bool nullable: false,
    bool withType: false,
    String typeKey}) {
  if (nullable == true || value != null) {
    if (serializer != null) {
      map[key] = serializer.toMap(value, withType: withType, typeKey: typeKey);
    } else if (processor != null) {
      map[key] = processor.serialize(value);
    } else {
      map[key] = value;
    }
  }
}

dynamic _buildSerializedValue(value,
    {Serializer serializer,
    FieldProcessor processor,
    bool withType: false,
    String typeKey}) {
  if (value is List) {
    return _buildSerializedListValue(value,
        serializer: serializer,
        processor: processor,
        withType: withType,
        typeKey: typeKey);
  } else if (value is Map) {
    
  }
  return value;
}

List _buildSerializedListValue(List values,
    {Serializer serializer,
    FieldProcessor processor,
    bool withType: false,
    String typeKey}) {
  if (serializer != null) {
    return values
        .map((v) =>
            serializer.serialize(v, typeKey: typeKey, withType: withType))
        .toList();
  } else if (processor != null) {
    return values.map(processor.serialize).toList();
  }
  return values;
}
