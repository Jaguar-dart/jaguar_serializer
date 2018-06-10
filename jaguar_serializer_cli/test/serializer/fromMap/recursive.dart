import 'package:test/test.dart';
import '../../models/recursive/recursive.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("Recursive", () {
        test("Normal", () {
          expect(
              new ASerializer().fromMap({
                'field': 1,
                'b': {
                  'field': 2,
                  'a': {
                    'field': 3,
                    'b': null,
                  }
                }
              }),
              new A(field: 1, b: new B(field: 2, a: new A(field: 3))));
        });
      });
    });
  });
}
