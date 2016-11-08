library serializer.test.all;

import 'serializer/builtin/builtin_to.dart' as builtinTo;
import 'serializer/builtin/builtin_from.dart' as builtinFrom;

import 'serializer/list/list_to.dart' as listTo;
import 'serializer/list/list_from.dart' as listFrom;

import 'generator/writer/list_map/list_map.dart' as genWriterListMap;

void main() {
  builtinTo.main();
  builtinFrom.main();

  listTo.main();
  listFrom.main();

  genWriterListMap.main();
}
