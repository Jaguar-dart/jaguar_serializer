library serializer.test.all;

import 'serializer/builtin/builtin_to.dart' as builtinTo;
import 'serializer/builtin/builtin_from.dart' as builtinFrom;

import 'serializer/list/list_to.dart' as listTo;
import 'serializer/list/list_from.dart' as listFrom;

import 'serializer/nested_objects/builtin_to.dart' as nestedObjectTo;

import 'generator/writer/list_map/list_map.dart' as genWriterListMap;

import 'serializer/various/various.dart' as various;

void main() {
  builtinTo.main();
  builtinFrom.main();

  listTo.main();
  listFrom.main();

  nestedObjectTo.main();

  various.main();

  genWriterListMap.main();
}
