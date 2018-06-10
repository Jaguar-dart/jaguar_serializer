import 'package:test/test.dart';
import '../../models/dynamic/dynamic.dart';

main() {
  group("Serializers", () {
    group("toMap", () {
      group("dynamic", () {
        test("MapListScalar", () {
          expect(
              new DynamicModelSerializer().toMap(new DynamicModel(
                  scalar: 5, list: ['5', 'five'], map: {'5': 'five'})),
              {
                'scalar': 5,
                'list': ['5', 'five'],
                'map': {'5': 'five'}
              });
        });
      });
    });
  });
}
