typedef String KeyMaker<Key>(Key key);
typedef Value ValueMaker<Value>(value);

Map<String, Value> nullableMapMaker<Value>(
    Map<String, dynamic> map, ValueMaker<Value> valueMaker) {
  Map<String, Value> ret;
  if (map != null) {
    ret = <String, Value>{};
    for (final key in map.keys) {
      ret[key] = valueMaker(map[key]);
    }
  }
  return ret;
}

Map<String, Value> nonNullableMapMaker<Value>(Map<String, dynamic> map,
        ValueMaker<Value> valueMaker, Map<String, Value> defaultValues) =>
    nullableMapMaker<Value>(map, valueMaker) ?? defaultValues;

void setNullableValue(Map<String, dynamic> map, String key, dynamic value) {
  map[key] = value;
}

void setNonNullableValue(Map<String, dynamic> map, String key, dynamic value) {
  if (value != null) {
    setNullableValue(map, key, value);
  }
}

List<T> nullableIterableMapper<T>(Iterable values, T callback(value)) =>
    values?.map<T>(callback)?.toList();

List<T> nonNullableIterableMapper<T>(
        Iterable values, T callback(value), List<T> defaultValues) =>
    nullableIterableMapper(values, callback) ?? defaultValues;
