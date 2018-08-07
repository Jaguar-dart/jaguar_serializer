import 'dart:async';
import 'package:test/test.dart';
import '../../models/set/set.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("Set", () {
        test("Normal", () async {
          final now1 = new DateTime.now().toUtc();
          await new Future.delayed(new Duration(seconds: 2));
          final now2 = new DateTime.now().toUtc();
          await new Future.delayed(new Duration(seconds: 2));
          final now3 = new DateTime.now().toUtc();
          await new Future.delayed(new Duration(seconds: 2));
          final now4 = new DateTime.now().toUtc();
          expect(
              new HasSetSerializer().fromMap({
                'builtIn': [1, 3, 4],
                'processed': [now1.toIso8601String(), now2.toIso8601String()],
                'builtInList': [
                  [1, 2, 3],
                  [4, 5, 6]
                ],
                'processedList': [
                  [now1.toIso8601String(), now2.toIso8601String()],
                  [now3.toIso8601String(), now4.toIso8601String()]
                ],
                'builtInMap': {
                  '1': [1, 2, 3],
                  '2': [4, 5, 6]
                },
                'processedMap': {
                  '1': [now1.toIso8601String(), now2.toIso8601String()],
                  '2': [now3.toIso8601String(), now4.toIso8601String()]
                }
              }),
              new HasSet(
                  builtIn: new Set<int>.from([1, 3, 4, 1, 3]),
                  processed: new Set.from([now1, now2]),
                  builtInList: [
                    new Set<int>.from([1, 2, 3]),
                    new Set<int>.from([4, 5, 6])
                  ],
                  processedList: [
                    new Set.from([now1, now2]),
                    new Set.from([now3, now4])
                  ],
                  builtInMap: {
                    '1': new Set<int>.from([1, 2, 3]),
                    '2': new Set<int>.from([4, 5, 6])
                  },
                  processedMap: {
                    '1': new Set.from([now1, now2]),
                    '2': new Set.from([now3, now4])
                  }));
        });
      });
    });
  });
}
