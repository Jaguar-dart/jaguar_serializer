import 'package:test/test.dart';
import '../../models/nested/nested.dart';

void main() {
  group("Serializer", () {
    group("fromMap", () {
      group("NestedList", () {
        test("Builtins.Normal", () {
          var ser = new NestedListSerializer();
          expect(
              ser.fromMap({
                "strings": [
                  ["String1", "String2"],
                  ["String3", "String4"]
                ],
                "dates": null,
                "leafs": null,
              }),
              new NestedList(strings: [
                ["String1", "String2"],
                ["String3", "String4"]
              ]));
        });

        test("ProcessedFields.Normal", () {
          var ser = new NestedListSerializer();
          expect(
              ser.fromMap({
                "dates": [
                  ["2018-01-01", "2018-01-02"],
                  ["2018-01-03", "2018-01-04"]
                ],
                "strings": null,
                "leafs": null,
              }),
              new NestedList(dates: [
                [new DateTime(2018, 1, 1), new DateTime(2018, 1, 2)],
                [new DateTime(2018, 1, 3), new DateTime(2018, 1, 4)]
              ]));
        });

        test("SerializedObjects.Normal", () {
          var ser = new NestedListSerializer();
          expect(
              ser.toMap(new NestedList(leafs: [
                [new Leaf(color: "Blue"), new Leaf(color: "Green")],
                [new Leaf(color: "Orange"), new Leaf(color: "Red")]
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
          var ser = new NestedListSerializer();
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
              new NestedList(strings: [
                ["String1", "String2"],
                null,
                ["String3", "String4"]
              ]));
        });

        test("ProcessedFields.SomeNull", () {
          var ser = new NestedListSerializer();
          expect(
              ser.fromMap({
                "dates": [
                  ["2018-01-01", "2018-01-02"],
                  null,
                  ["2018-01-03", "2018-01-04"]
                ],
                "strings": null,
                "leafs": null,
              }),
              new NestedList(dates: [
                [new DateTime(2018, 1, 1), new DateTime(2018, 1, 2)],
                null,
                [new DateTime(2018, 1, 3), new DateTime(2018, 1, 4)]
              ]));
        });

        test("SerializedObjects.Normal", () {
          var ser = new NestedListSerializer();
          expect(
              ser.toMap(new NestedList(leafs: [
                [new Leaf(color: "Blue"), new Leaf(color: "Green")],
                null,
                [new Leaf(color: "Orange"), new Leaf(color: "Red")]
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
