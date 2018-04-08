import 'common/models/field_format/field_format.dart';
import 'package:test/test.dart';

void main() {
  final _serializer = new FieldFormatTestSerializer();
  test("field format", () {
    final obj = new FieldFormatTest();

    final map = _serializer.serialize(obj) as Map<String, dynamic>;

    expect(map["foo_bar"], equals("42"));
    expect(map["my_field"], equals(42));

    final decoded = _serializer.fromMap(map);

    expect(decoded.fooBar, equals("42"));
    expect(decoded.myField, equals(42));
  });
}
