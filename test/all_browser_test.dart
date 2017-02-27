library serializer.test.all;

import 'serializer/builtin/builtin_to.dart' as builtinTo;
import 'serializer/builtin/builtin_from.dart' as builtinFrom;

import 'serializer/list/list_to.dart' as listTo;
import 'serializer/list/list_from.dart' as listFrom;

import 'serializer/nested_objects/builtin_to.dart' as nestedObjectTo;

import 'serializer/various/various.dart' as various;

import 'serializer/serializer_json.dart' as serializer_json;
import 'serializer/serializer_yaml.dart' as serializer_yaml;

void main() {
  builtinTo.main();
  builtinFrom.main();

  listTo.main();
  listFrom.main();

  nestedObjectTo.main();

  various.main();

  serializer_json.main();
  serializer_yaml.main();
}
