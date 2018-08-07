import 'package:test/test.dart';
import '../../models/auto_find_serializer/auto_find_serializer.dart';

main() {
  group("Serializers", () {
    group("toMap", () {
      group("AutoFindSerializer", () {
        test("Normal", () {
          expect(
              new BSerializer().toMap(new B(
                  field: 'b', a: new A(field: 'a'), c: new C(field: 'c'))),
              {
                'field': 'b',
                'a': {'field': 'a'},
                'c': {'field': 'c'}
              });
        });
      });
    });
  });
}
