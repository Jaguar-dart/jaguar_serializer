part of jaguar_serializer.generator.helpers;

final RegExp _camelCaseRegexp = new RegExp(r'^[a-z][A-Za-z\d]*$');
final RegExp _snakeCaseRegexp = new RegExp(r'^[a-z]+[a-z\d]*(?:_[\w\d]+)*$');
final RegExp _kebabCaseRegexp = new RegExp(r'^[a-z]+[a-z\d]*(?:-[\w\d]+)*$');
const String _snakeCaseSeparator = '_';
const String _kebabCaseSeparator = '-';

final RegExp _camelCaseSpliter = new RegExp('[A-Z]|[0-9]+');

typedef String FieldFormatter(String name);

String toCamelCase(String str) {
  if (_snakeCaseRegexp.hasMatch(str)) {
    return toCamelCaseFromSeparator(str, _snakeCaseSeparator);
  } else if (_kebabCaseRegexp.hasMatch(str)) {
    return toCamelCaseFromSeparator(str, _kebabCaseSeparator);
  }
  return str;
}

String toCamelCaseFromSeparator(String str, String separator) =>
    firstCharToLowerCase(
        str.split(separator).map(firstCharToUpperCase).join(""));

String separateCamelCase(String str, String separator) =>
    splitCamelCase(str).map((s) => s.toLowerCase()).join(separator);

String toSnakeCase(String str) {
  if (_camelCaseRegexp.hasMatch(str)) {
    return separateCamelCase(str, _snakeCaseSeparator);
  } else if (_kebabCaseRegexp.hasMatch(str)) {
    return str
        .replaceAll(_kebabCaseSeparator, _snakeCaseSeparator)
        .toLowerCase();
  }
  return str.toLowerCase();
}

String toKebabCase(String str) {
  if (_camelCaseRegexp.hasMatch(str)) {
    return separateCamelCase(str, _kebabCaseSeparator);
  } else if (_snakeCaseRegexp.hasMatch(str)) {
    return str
        .replaceAll(_snakeCaseSeparator, _kebabCaseSeparator)
        .toLowerCase();
  }
  return str.toLowerCase();
}

Iterable<String> splitCamelCase(String str) => str
    .replaceAllMapped(_camelCaseSpliter, (match) => ' ${match.group(0)}')
    .trim()
    .split(' ');
