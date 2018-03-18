import 'repo.dart';

typedef String KeyMaker<Key>(Key key);
typedef dynamic ValueMaker<Value>(Value value);

Map<String, dynamic> nullableMapMaker<Value>(
    Map<String, dynamic> map, ValueMaker<Value> valueMaker) {
  Map<String, dynamic> ret;
  if (map != null) {
    ret = <String, dynamic>{};
    for (final key in map.keys) {
      ret[key] = valueMaker(map[key] as Value);
    }
  }
  return ret;
}

Map<String, dynamic> nonNullableMapMaker<Value>(Map<String, dynamic> map,
        ValueMaker<Value> valueMaker, Map<String, dynamic> defaultValues) =>
    nullableMapMaker<Value>(map, valueMaker) ?? defaultValues;

void setNullableValue(Map<String, dynamic> map, String key, dynamic value) {
  map[key] = value;
}

void setNonNullableValue(Map<String, dynamic> map, String key, dynamic value) {
  if (value != null) {
    setNullableValue(map, key, value);
  }
}

List nullableIterableMapper<T>(Iterable<T> values, dynamic callback(T value)) =>
    values?.map<dynamic>(callback)?.toList();

List nonNullableIterableMapper<T>(
        Iterable<T> values, dynamic callback(T value), List<T> defaultValues) =>
    nullableIterableMapper<T>(values, callback) ?? defaultValues;

void setTypeKeyValue(String typeKey, String modelString, bool withType,
    Map<String, dynamic> map) {
  if (modelString != null && withType) {
    map[typeKey ?? defaultTypeInfoKey] = modelString;
  }
}
