import 'package:test/test.dart';
import '../../models/non_string_key/non_string_key.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("NonStringKey", () {
        test("MapListScalar", () {
          expect(
              ModelSerializer().fromMap({
                'intKeyed': {'5': 'five'}
              }),
              Model(intKeyed: {5: 'five'}));
        });
      });
    });
  });
}
