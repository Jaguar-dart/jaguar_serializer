import 'package:test/test.dart';
import '../../models/non_string_key/non_string_key.dart';

main() {
  group("Serializers", () {
    group("toMap", () {
      group("NonStringKey", () {
        test("MapListScalar", () {
          expect(
              new ModelSerializer().toMap(new Model(intKeyed: {5: 'five'})), {
            'intKeyed': {'5': 'five'}
          });
        });
      });
    });
  });
}
