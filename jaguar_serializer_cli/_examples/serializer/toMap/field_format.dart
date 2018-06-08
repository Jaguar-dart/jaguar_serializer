import '../../common/models/field_format/field_format.dart';
import 'package:test/test.dart';

void main() {
  final _serializer = new FieldFormatTestSerializer();
  test("field format", () {
    final obj = new FieldFormatTest();

    final map = _serializer.toMap(obj);

    expect(map["foo_bar"], equals("42"));
    expect(map["my_field"], equals(42));
  });
}
