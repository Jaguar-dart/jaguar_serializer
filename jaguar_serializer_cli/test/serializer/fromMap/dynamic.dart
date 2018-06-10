import 'package:test/test.dart';
import '../../models/dynamic/dynamic.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("dynamic", () {
        test("MapListScalar", () {
          expect(
              new DynamicModelSerializer().fromMap({
                'scalar': 5,
                'list': ['5', 'five'],
                'map': {'5': 'five'}
              }),
              new DynamicModel(
                  scalar: 5, list: ['5', 'five'], map: {'5': 'five'}));
        });
      });
    });
  });
}
