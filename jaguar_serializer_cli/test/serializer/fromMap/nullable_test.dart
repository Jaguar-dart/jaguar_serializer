import '../../models/nullable/nullable.dart';
import 'package:test/test.dart';

main() {
  group('toMap', () {
    group('nullable', () {
      group('global', () {
        test('Filled', () {
          final now = new DateTime.now();
          final model = new Model()
            ..builtIn = "bar"
            ..processed = now
            ..serialized = new ModelInt()
            ..processedList = [now]
            ..processedMap = {"1": now}
            ..serializedList = [new ModelInt()]
            ..serializedMap = {"1": new ModelInt()};

          expect(
              new NonNullableSerializer().fromMap({
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
              new NonNullableSerializer().fromMap({}),
              new Model()
                ..serialized = new ModelInt()
                ..processedList = []
                ..processedMap = {}
                ..serializedList = []
                ..serializedMap = {});
        });
      });
    });
  });
}
