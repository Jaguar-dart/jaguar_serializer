import 'package:test/test.dart';
import '../../models/nested/nested.dart';

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
                  "a": {
                    "1": new DateTime(2018, 1, 1).toIso8601String(),
                    "2": new DateTime(2018, 1, 2).toIso8601String()
                  },
                  "b": {
                    "3": new DateTime(2018, 1, 3).toIso8601String(),
                    "4": new DateTime(2018, 1, 4).toIso8601String()
                  }
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
                  "a": {
                    "1": new DateTime(2018, 1, 1).toIso8601String(),
                    "2": new DateTime(2018, 1, 2).toIso8601String()
                  },
                  "b": {
                    "3": new DateTime(2018, 1, 3).toIso8601String(),
                    "4": new DateTime(2018, 1, 4).toIso8601String()
                  },
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
