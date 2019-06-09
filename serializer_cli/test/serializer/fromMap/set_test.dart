import 'dart:async';
import 'package:test/test.dart';
import '../../models/set/set.dart';

main() {
  group("Serializers", () {
    group("fromMap", () {
      group("Set", () {
        test("Normal", () async {
          final now1 = DateTime.now().toUtc();
          await Future.delayed(Duration(seconds: 2));
          final now2 = DateTime.now().toUtc();
          await Future.delayed(Duration(seconds: 2));
          final now3 = DateTime.now().toUtc();
          await Future.delayed(Duration(seconds: 2));
          final now4 = DateTime.now().toUtc();
          expect(
              HasSetSerializer().fromMap({
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
              HasSet(
                  builtIn: Set<int>.from([1, 3, 4, 1, 3]),
                  processed: Set.from([now1, now2]),
                  builtInList: [
                    Set<int>.from([1, 2, 3]),
                    Set<int>.from([4, 5, 6])
                  ],
                  processedList: [
                    Set.from([now1, now2]),
                    Set.from([now3, now4])
                  ],
                  builtInMap: {
                    '1': Set<int>.from([1, 2, 3]),
                    '2': Set<int>.from([4, 5, 6])
                  },
                  processedMap: {
                    '1': Set.from([now1, now2]),
                    '2': Set.from([now3, now4])
                  }));
        });
      });
    });
  });
}
