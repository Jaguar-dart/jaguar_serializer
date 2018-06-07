import "../common/field_processor/datetime.dart";
import "package:test/test.dart";

void main() {
  group("Base", () {
    test("should handle processor", () {
      DateTime now = new DateTime.now();

      Date d = new Date(date: now, place: 'Stockholm');
      final serializer = new DateSerializer();
      expect(serializer.toMap(d),
          {"date": now.toIso8601String(), 'place': 'Stockholm'});
    });
  });
}
