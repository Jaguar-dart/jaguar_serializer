import '../../models/nullable/nullable.dart';
import 'package:test/test.dart';

main() {
  group('toMap', () {
    group('nullable', () {
      group('global', () {
        test('Filled', () {
          final now = new DateTime.now().toUtc();
          final model = new Model()
            ..processed = now
            ..builtIn = "bar"
            ..processedList = [now]
            ..processedMap = {"1": now}
            ..serialized = new ModelInt()
            ..serializedList = [new ModelInt()]
            ..serializedMap = {"1": new ModelInt()};

          expect(new NonNullableSerializer().toMap(model), {
            'builtIn': 'bar',
            'serialized': {'bar': 42},
            'processed': now.toIso8601String(),
            'serializedList': [
              {'bar': 42}
            ],
            'serializedMap': {
              '1': {'bar': 42}
            },
            'processedList': [now.toIso8601String()],
            'processedMap': {'1': now.toIso8601String()}
          });
        });

        test('WhenNull', () {
          expect(new NonNullableSerializer().toMap(new Model()), {
            'serializedList': [],
            'serializedMap': {},
            'processedList': [],
            'processedMap': {}
          });
        });
      });
    });
  });
}
