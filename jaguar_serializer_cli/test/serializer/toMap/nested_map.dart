import 'package:test/test.dart';
import '../../common/nested/nested.dart';

void main() {
  group("Serializer", () {
    group("toMap", () {
      group("NestedMap", () {
        test("Builtins.Normal", () {
          var ser = new NestedMapSerializer();
          expect(
              ser.toMap(new NestedMap(strings: {
                "a": {"1": "String1", "2": "String2"},
                "b": {"3": "String3", "4": "String4"}
              })),
              {
                "strings": {
                  "a": {"1": "String1", "2": "String2"},
                  "b": {"3": "String3", "4": "String4"}
                },
                "dates": null,
                "leafs": null,
              });
        });

        test("ProcessedFields.Normal", () {
          var ser = new NestedMapSerializer();
          expect(
              ser.toMap(new NestedMap(dates: {
                "a": {
                  "1": new DateTime(2018, 1, 1),
                  "2": new DateTime(2018, 1, 2)
                },
                "b": {
                  "3": new DateTime(2018, 1, 3),
                  "4": new DateTime(2018, 1, 4)
                }
              })),
              {
                "dates": {
                  "a": {"1": "2018-01-01", "2": "2018-01-02"},
                  "b": {"3": "2018-01-03", "4": "2018-01-04"}
                },
                "strings": null,
                "leafs": null,
              });
        });

        test("SerializedObjects.Normal", () {
          var ser = new NestedMapSerializer();
          expect(
              ser.toMap(new NestedMap(leafs: {
                "a": {
                  "1": new Leaf(color: "Blue"),
                  "2": new Leaf(color: "Green")
                },
                "b": {
                  "3": new Leaf(color: "Orange"),
                  "4": new Leaf(color: "Red")
                }
              })),
              {
                "leafs": {
                  "a": {
                    "1": {"color": "Blue"},
                    "2": {"color": "Green"}
                  },
                  "b": {
                    "3": {"color": "Orange"},
                    "4": {"color": "Red"}
                  }
                },
                "strings": null,
                "dates": null,
              });
        });

        test("Builtins.SomeNull", () {
          var ser = new NestedMapSerializer();
          expect(
              ser.toMap(new NestedMap(strings: {
                "a": {"1": "String1", "2": "String2"},
                "b": {"3": "String3", "4": "String4"},
                "c": null,
              })),
              {
                "strings": {
                  "a": {"1": "String1", "2": "String2"},
                  "b": {"3": "String3", "4": "String4"},
                  "c": null,
                },
                "dates": null,
                "leafs": null,
              });
        });

        test("ProcessedFields.Normal", () {
          var ser = new NestedMapSerializer();
          expect(
              ser.toMap(new NestedMap(dates: {
                "a": {
                  "1": new DateTime(2018, 1, 1),
                  "2": new DateTime(2018, 1, 2)
                },
                "b": {
                  "3": new DateTime(2018, 1, 3),
                  "4": new DateTime(2018, 1, 4)
                },
                "c": null,
              })),
              {
                "dates": {
                  "a": {"1": "2018-01-01", "2": "2018-01-02"},
                  "b": {"3": "2018-01-03", "4": "2018-01-04"},
                  "c": null,
                },
                "strings": null,
                "leafs": null,
              });
        });

        test("SerializedObjects.Normal", () {
          var ser = new NestedMapSerializer();
          expect(
              ser.toMap(new NestedMap(leafs: {
                "a": {
                  "1": new Leaf(color: "Blue"),
                  "2": new Leaf(color: "Green")
                },
                "b": {
                  "3": new Leaf(color: "Orange"),
                  "4": new Leaf(color: "Red")
                },
                "c": null,
              })),
              {
                "leafs": {
                  "a": {
                    "1": {"color": "Blue"},
                    "2": {"color": "Green"}
                  },
                  "b": {
                    "3": {"color": "Orange"},
                    "4": {"color": "Red"}
                  },
                  "c": null,
                },
                "strings": null,
                "dates": null,
              });
        });
      });
    });
  });
}
