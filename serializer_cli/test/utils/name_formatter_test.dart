import 'package:test/test.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

main() {
  group("FieldFormatter", () {
    test("SnakeCase", () {
      expect(toSnakeCase('oneField'), 'one_field');
      expect(toSnakeCase('oneField_street'), 'one_field_street');
      expect(toSnakeCase('one_field'), 'one_field');
    });

    test("KebabCase", () {
      expect(toKebabCase('oneField'), 'one-field');
      expect(toKebabCase('oneField_street'), 'one-field-street');
      expect(toKebabCase('one_field'), 'one-field');
    });

    test("CamelCase", () {
      expect(toCamelCase('oneField'), 'oneField');
      expect(toCamelCase('oneField_street'), 'oneFieldStreet');
      expect(toCamelCase('one_field'), 'oneField');
    });

    test("OnlyFirstChar", () {
      expect(onlyFirstChar('oneField'), 'o');
      expect(onlyFirstChar('OneField'), 'O');
    });

    test("OnlyFirstCharInCaps", () {
      expect(onlyFirstCharInCaps('oneField'), 'O');
      expect(onlyFirstCharInCaps('OneField'), 'O');
    });

    test("OnlyFirstCharInLower", () {
      expect(onlyFirstCharInLower('oneField'), 'o');
      expect(onlyFirstCharInLower('OneField'), 'o');
    });
  });
}
