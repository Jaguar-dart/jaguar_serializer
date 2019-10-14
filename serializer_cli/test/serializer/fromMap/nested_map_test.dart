import 'package:test/test.dart';
import '../../models/nested/nested.dart';

void main() {
  group("Serializer", () {
    group("fromMap", () {
      group("NestedMap", () {
        test("Builtins.Normal", () {
          var ser = NestedMapSerializer();
          expect(
              ser.fromMap({
                "strings": {
                  "a": {"1": "String1", "2": "String2"},
                  "b": {"3": "String3", "4": "String4"}
                },
                "dates": null,
                "leafs": null,
              }),
              NestedMap(strings: {
                "a": {"1": "String1", "2": "String2"},
                "b": {"3": "String3", "4": "String4"}
              }));
        });

        test("ProcessedFields.Normal", () {
          var ser = NestedMapSerializer();
          expect(
              ser.fromMap({
                "dates": {
                  "a": {"1": "2018-01-01", "2": "2018-01-02"},
                  "b": {"3": "2018-01-03", "4": "2018-01-04"}
                },
                "strings": null,
                "leafs": null,
              }),
              NestedMap(dates: {
                "a": {"1": DateTime(2018, 1, 1), "2": DateTime(2018, 1, 2)},
                "b": {"3": DateTime(2018, 1, 3), "4": DateTime(2018, 1, 4)}
              }));
        });

        test("SerializedObjects.Normal", () {
          var ser = NestedMapSerializer();
          expect(
              ser.fromMap({
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
              }),
              NestedMap(leafs: {
                "a": {"1": Leaf(color: "Blue"), "2": Leaf(color: "Green")},
                "b": {"3": Leaf(color: "Orange"), "4": Leaf(color: "Red")}
              }));
        });

        test("Builtins.Normal", () {
          var ser = NestedMapSerializer();
          expect(
              ser.fromMap({
                "strings": {
                  "a": {"1": "String1", "2": "String2"},
                  "b": {"3": "String3", "4": "String4"},
                  "c": null,
                },
                "dates": null,
                "leafs": null,
              }),
              NestedMap(strings: {
                "a": {"1": "String1", "2": "String2"},
                "b": {"3": "String3", "4": "String4"},
                "c": null,
              }));
        });

        test("ProcessedFields.Normal", () {
          var ser = NestedMapSerializer();
          expect(
              ser.fromMap({
                "dates": {
                  "a": {"1": "2018-01-01", "2": "2018-01-02"},
                  "b": {"3": "2018-01-03", "4": "2018-01-04"},
                  "c": null,
                },
                "strings": null,
                "leafs": null,
              }),
              NestedMap(dates: {
                "a": {"1": DateTime(2018, 1, 1), "2": DateTime(2018, 1, 2)},
                "b": {"3": DateTime(2018, 1, 3), "4": DateTime(2018, 1, 4)},
                "c": null,
              }));
        });

        test("SerializedObjects.Normal", () {
          var ser = NestedMapSerializer();
          expect(
              ser.fromMap({
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
              }),
              NestedMap(leafs: {
                "a": {"1": Leaf(color: "Blue"), "2": Leaf(color: "Green")},
                "b": {"3": Leaf(color: "Orange"), "4": Leaf(color: "Red")},
                "c": null,
              }));
        });
      });
    });
  });
}
