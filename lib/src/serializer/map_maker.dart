part of jaguar_serializer.serializer;

class MapMaker<KF, VF, KT, VT> {
  Map<KT, VT> _model;

  MapMaker(Map<KF, VF> map, [KT keyMapper(KF from), VT valueMapper(VF from)]) {
    if (map is Map) {
      _model = new Map<KT, VT>();
      map.forEach((KF key, VF value) {
        _model[keyMapper(key)] = valueMapper(value);
      });
    }
  }

  Map<KT, VT> get model => _model;
}
