import '../../models/nullable/nullable.dart';
import 'package:test/test.dart';

main() {
  group('toMap', () {
    group('nullable', () {
      group('global', () {
        test('Filled', () {
          final now = DateTime.now().toUtc();
          final model = Model()
            ..processed = now
            ..builtIn = "bar"
            ..processedList = [now]
            ..processedMap = {"1": now}
            ..serialized = ModelInt()
            ..serializedList = [ModelInt()]
            ..serializedMap = {"1": ModelInt()};

          expect(NonNullableSerializer().toMap(model), {
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
          expect(NonNullableSerializer().toMap(Model()), {
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
