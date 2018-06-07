import '../../common/models/nullable/nullable.dart';
import 'package:test/test.dart';

main() {
  group('toMap', () {
    group('nullable', () {
      group('global', () {
        test('Filled', () {
          final now = new DateTime.now();
          final model = new Model()
            ..date = now
            ..foo = "bar"
            ..listDates = [now]
            ..mapDates = {"1": now}
            ..modelInt = new ModelInt()
            ..listModelInt = [new ModelInt()]
            ..mapModelInt = {"1": new ModelInt()};

          expect(new NonNullableSerializer().toMap(model), {
            'foo': 'bar',
            'modelInt': {'bar': 42},
            'date': now.toIso8601String(),
            'listModelInt': [
              {'bar': 42}
            ],
            'mapModelInt': {
              '1': {'bar': 42}
            },
            'listDates': [now.toIso8601String()],
            'mapDates': {'1': now.toIso8601String()}
          });
        });

        test('WhenNull', () {
          expect(new NonNullableSerializer().toMap(new Model()), {
            'listModelInt': [],
            'mapModelInt': {},
            'listDates': [],
            'mapDates': {}
          });
        });
      });
    });
  });
}
