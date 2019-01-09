import 'package:test/test.dart';
import '../../models/recursive/recursive.dart';

main() {
  group("Serializers", () {
    group("toMap", () {
      group("Recursive", () {
        test("Normal", () {
          expect(
              new ASerializer().toMap(
                  new A(field: 1, b: new B(field: 2, a: new A(field: 3)))),
              {
                'field': 1,
                'b': {
                  'field': 2,
                  'a': {
                    'field': 3,
                    'b': null,
                  }
                }
              });
        });
      });
    });
  });
}
