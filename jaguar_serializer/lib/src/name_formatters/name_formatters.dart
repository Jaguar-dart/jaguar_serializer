final RegExp _camelCaseSpliter = new RegExp('[A-Z]|[0-9]+');
const String _snakeCaseSeparator = '_';
const String _kebabCaseSeparator = '-';

String withFirstCharInCaps(String str) =>
    "${str[0].toUpperCase()}${str.substring(1)}";

String withFirstCharInLower(String str) =>
    "${str[0].toLowerCase()}${str.substring(1)}";

String _toCamelCaseFromSeparator(String str, String separator) =>
    withFirstCharInLower(str.split(separator).map(withFirstCharInCaps).join());

Iterable<String> splitCamelCase(String str) => str
    .replaceAllMapped(_camelCaseSpliter, (match) => ' ${match.group(0)}')
    .trim()
    .split(' ');

String toCamelCase(String input) =>
    _toCamelCaseFromSeparator(input, _snakeCaseSeparator);

String toSnakeCase(String input) =>
    splitCamelCase(input).map((s) => s.toLowerCase()).join(_snakeCaseSeparator);

String toKebabCase(String input) => splitCamelCase(input)
    .map((s) => s.toLowerCase())
    .join(_kebabCaseSeparator)
    .replaceAll(_snakeCaseSeparator, _kebabCaseSeparator);

String onlyFirstChar(String input) => input[0];

String onlyFirstCharInCaps(String input) => input[0].toUpperCase();

String onlyFirstCharInLower(String input) => input[0].toLowerCase();
