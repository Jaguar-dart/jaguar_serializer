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

void setNullableValue(Map<String, dynamic> map, String key, value) {
  map[key] = value;
}

void setNonNullableValue(Map<String, dynamic> map, String key, value) {
  if (value != null) {
    map[key] = value;
  }
}

List safeIterableMapper<T>(Iterable<T> values, callback(T value)) =>
    values?.map((T value) {
      if (value == null) {
        return null;
      }
      return callback(value);
    })?.toList();
