import 'package:test/test.dart';
import '../../models/recursive/recursive.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("Recursive", () {
        test("Normal", () {
          expect(
              ASerializer().fromMap({
                'field': 1,
                'b': {
                  'field': 2,
                  'a': {
                    'field': 3,
                    'b': null,
                  }
                }
              }),
              A(field: 1, b: B(field: 2, a: A(field: 3))));
        });
      });
    });
  });
}
