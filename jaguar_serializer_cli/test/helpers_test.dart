import 'package:jaguar_serializer_cli/src/helpers/helpers.dart';
import 'package:test/test.dart';

void main() {
  group("Fields format", () {
    test("camelCase", () {
      expect(toCamelCase("camelCase"), equals("camelCase"));
      expect(toCamelCase("camel_Case"), equals("camelCase"));
      expect(toCamelCase("camel_case"), equals("camelCase"));
      expect(toCamelCase("camel-Case"), equals("camelCase"));
      expect(toCamelCase("camel-case"), equals("camelCase"));
    });

    test("snake_case", () {
      expect(toSnakeCase("camelCase"), equals("camel_case"));
      expect(toSnakeCase("camel_Case"), equals("camel_case"));
      expect(toSnakeCase("camel_case"), equals("camel_case"));
      expect(toSnakeCase("camel-Case"), equals("camel_case"));
      expect(toSnakeCase("camel-case"), equals("camel_case"));
    });

    test("kebab-case", () {
      expect(toKebabCase("camelCase"), equals("camel-case"));
      expect(toKebabCase("camel_Case"), equals("camel-case"));
      expect(toKebabCase("camel_case"), equals("camel-case"));
      expect(toKebabCase("camel-Case"), equals("camel-case"));
      expect(toKebabCase("camel-case"), equals("camel-case"));
    });
  });
}
