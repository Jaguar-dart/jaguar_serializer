import 'package:test/test.dart';
import '../../models/auto_find_serializer/auto_find_serializer.dart';

main() {
  group("Serializers", () {
    group("toMap", () {
      group("AutoFindSerializer", () {
        test("Normal", () {
          expect(
              BSerializer()
                  .toMap(B(field: 'b', a: A(field: 'a'), c: C(field: 'c'))),
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
