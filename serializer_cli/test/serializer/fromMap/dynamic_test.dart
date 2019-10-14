import 'package:test/test.dart';
import '../../models/dynamic/dynamic.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("dynamic", () {
        test("MapListScalar", () {
          expect(
              DynamicModelSerializer().fromMap({
                'scalar': 5,
                'list': ['5', 'five'],
                'map': {'5': 'five'}
              }),
              DynamicModel(scalar: 5, list: ['5', 'five'], map: {'5': 'five'}));
        });
        test("Pass", () {
          var dt1 = DateTime.now();
          var dt2 = dt1.add(Duration(minutes: 1));
          expect(
              DynamicPassSerializer().fromMap({
                'scalar': dt1,
                'list': ['5', 'five', dt1],
                'map': {'5': 'five', 'date': dt2}
              }),
              DynamicModel(
                  scalar: dt1,
                  list: ['5', 'five', dt1],
                  map: {'5': 'five', 'date': dt2}));
        });
      });
    });
  });
}
