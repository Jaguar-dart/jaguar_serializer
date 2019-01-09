import 'package:test/test.dart';
import '../../models/auto_find_serializer/auto_find_serializer.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("AutoFindSerializer", () {
        test("Normal", () {
          expect(
              new BSerializer().fromMap({
                'field': 'b',
                'a': {'field': 'a'},
                'c': {'field': 'c'}
              }),
              new B(field: 'b', a: new A(field: 'a'), c: new C(field: 'c')));
        });
      });
    });
  });
}
