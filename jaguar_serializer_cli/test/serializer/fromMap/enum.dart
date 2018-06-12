import 'package:test/test.dart';
import '../../models/enums/enums.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("Enum", () {
        test("Normal", () {
          expect(
              new ModelSerializer().fromMap({
                'field': 1,
                'list': [0, 1],
                'map': {'Boy': 1}
              }),
              new Model(
                  field: Gender.Male,
                  list: [Gender.Female, Gender.Male],
                  map: {'Boy': Gender.Male}));
        });
      });
    });
  });
}
