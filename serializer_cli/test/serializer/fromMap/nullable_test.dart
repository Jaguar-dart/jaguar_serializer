import '../../models/nullable/nullable.dart';
import 'package:test/test.dart';

main() {
  group('toMap', () {
    group('nullable', () {
      group('global', () {
        test('Filled', () {
          final now = DateTime.now();
          final model = Model()
            ..builtIn = "bar"
            ..processed = now
            ..serialized = ModelInt()
            ..processedList = [now]
            ..processedMap = {"1": now}
            ..serializedList = [ModelInt()]
            ..serializedMap = {"1": ModelInt()};

          expect(
              NonNullableSerializer().fromMap({
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
              }),
              model);
        });

        test('WhenNull', () {
          expect(
              NonNullableSerializer().fromMap({}),
              Model()
                ..serialized = ModelInt()
                ..processedList = []
                ..processedMap = {}
                ..serializedList = []
                ..serializedMap = {});
        });
      });
    });
  });
}
