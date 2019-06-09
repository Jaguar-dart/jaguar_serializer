import 'package:test/test.dart';
import '../../models/nested/nested.dart';

void main() {
  group("Serializer", () {
    group("fromMap", () {
      group("NestedList", () {
        test("Builtins.Normal", () {
          var ser = NestedListSerializer();
          expect(
              ser.fromMap({
                "strings": [
                  ["String1", "String2"],
                  ["String3", "String4"]
                ],
                "dates": null,
                "leafs": null,
              }),
              NestedList(strings: [
                ["String1", "String2"],
                ["String3", "String4"]
              ]));
        });

        test("ProcessedFields.Normal", () {
          var ser = NestedListSerializer();
          expect(
              ser.fromMap({
                "dates": [
                  [
                    DateTime(2018, 1, 1).toIso8601String(),
                    DateTime(2018, 1, 2).toIso8601String()
                  ],
                  [
                    DateTime(2018, 1, 3).toIso8601String(),
                    DateTime(2018, 1, 4).toIso8601String()
                  ]
                ],
                "strings": null,
                "leafs": null,
              }),
              NestedList(dates: [
                [DateTime(2018, 1, 1), DateTime(2018, 1, 2)],
                [DateTime(2018, 1, 3), DateTime(2018, 1, 4)]
              ]));
        });

        test("SerializedObjects.Normal", () {
          var ser = NestedListSerializer();
          expect(
              ser.toMap(NestedList(leafs: [
                [Leaf(color: "Blue"), Leaf(color: "Green")],
                [Leaf(color: "Orange"), Leaf(color: "Red")]
              ])),
              {
                "leafs": [
                  [
                    {"color": "Blue"},
                    {"color": "Green"}
                  ],
                  [
                    {"color": "Orange"},
                    {"color": "Red"}
                  ]
                ],
                "strings": null,
                "dates": null,
              });
        });

        test("Builtins.SomeNull", () {
          var ser = NestedListSerializer();
          expect(
              ser.fromMap({
                "strings": [
                  ["String1", "String2"],
                  null,
                  ["String3", "String4"]
                ],
                "dates": null,
                "leafs": null,
              }),
              NestedList(strings: [
                ["String1", "String2"],
                null,
                ["String3", "String4"]
              ]));
        });

        test("ProcessedFields.SomeNull", () {
          var ser = NestedListSerializer();
          expect(
              ser.fromMap({
                "dates": [
                  [
                    DateTime(2018, 1, 1).toIso8601String(),
                    DateTime(2018, 1, 2).toIso8601String()
                  ],
                  null,
                  [
                    DateTime(2018, 1, 3).toIso8601String(),
                    DateTime(2018, 1, 4).toIso8601String()
                  ]
                ],
                "strings": null,
                "leafs": null,
              }),
              NestedList(dates: [
                [DateTime(2018, 1, 1), DateTime(2018, 1, 2)],
                null,
                [DateTime(2018, 1, 3), DateTime(2018, 1, 4)]
              ]));
        });

        test("SerializedObjects.Normal", () {
          var ser = NestedListSerializer();
          expect(
              ser.toMap(NestedList(leafs: [
                [Leaf(color: "Blue"), Leaf(color: "Green")],
                null,
                [Leaf(color: "Orange"), Leaf(color: "Red")]
              ])),
              {
                "leafs": [
                  [
                    {"color": "Blue"},
                    {"color": "Green"}
                  ],
                  null,
                  [
                    {"color": "Orange"},
                    {"color": "Red"}
                  ]
                ],
                "strings": null,
                "dates": null,
              });
        });
      });
    });
  });
}
