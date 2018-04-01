import "package:jaguar_serializer/jaguar_serializer.dart";

part 'field_format.g.dart';

class FieldFormatTest {
  String fooBar = "42";
  int myField = 42;
}

@GenSerializer(fieldFormat: FieldFormat.snakeCase)
class FieldFormatTestSerializer extends Serializer<FieldFormatTest>
    with _$FieldFormatTestSerializer {}
