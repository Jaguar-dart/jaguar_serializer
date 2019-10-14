import 'package:test/test.dart';
import '../../models/enums/enums.dart';

main() {
  group("Serializers", () {
    group("toMap", () {
      group("Enum", () {
        test("Normal", () {
          expect(
              ModelSerializer().toMap(Model(
                  field: Gender.Male,
                  list: [Gender.Female, Gender.Male],
                  map: {'Boy': Gender.Male})),
              {
                'field': 1,
                'list': [0, 1],
                'map': {'Boy': 1}
              });
        });
      });
    });
  });
}
