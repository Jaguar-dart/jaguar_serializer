import 'package:test/test.dart';
import '../../models/auto_find_serializer/auto_find_serializer.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("AutoFindSerializer", () {
        test("Normal", () {
          expect(
              BSerializer().fromMap({
                'field': 'b',
                'a': {'field': 'a'},
                'c': {'field': 'c'}
              }),
              B(field: 'b', a: A(field: 'a'), c: C(field: 'c')));
        });
      });
    });
  });
}
