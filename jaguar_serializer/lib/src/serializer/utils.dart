typedef String KeyMaker<Key>(Key key);
typedef Value ValueMaker<Value>(value);

void setMapValue(Map<String, dynamic> map, String key, dynamic value) {
  map[key] = value;
}

void setMapValueIfNotNull(Map<String, dynamic> map, String key, dynamic value) {
  if (value != null) map[key] = value;
}

List<T> codeIterable<T>(Iterable values, T callback(value)) =>
    values?.map<T>(callback)?.toList();

List<T> codeNonNullIterable<T>(
        Iterable values, T callback(value), List<T> defaultValues) =>
    codeIterable(values, callback) ?? defaultValues;

Map<String, Value> codeMap<Value>(
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

Map<String, Value> codeNonNullMap<Value>(Map<String, dynamic> map,
        ValueMaker<Value> valueMaker, Map<String, Value> defaultValues) =>
    codeMap<Value>(map, valueMaker) ?? defaultValues;

Set<T> codeSet<T>(Iterable values, T callback(value)) {
  if (values == null) return null;
  return new Set<T>.from(values.map<T>(callback));
}

Set<T> codeNonNullSet<T>(Iterable values, T callback(value)) {
  if (values == null) return new Set<T>();
  return new Set<T>.from(values.map<T>(callback));
}
