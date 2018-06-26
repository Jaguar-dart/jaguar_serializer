import 'package:build_runner/build_runner.dart' as _i1;
import 'package:build_config/build_config.dart' as _i3;
import 'package:jaguar_serializer_cli/builder.dart';
import 'dart:isolate' as _i9;

final _builders = [
  _i1.apply('jaguar_serializer_cli|jaguar_serializer_cli', [jaguarSerializer],
      _i1.toRoot(),
      defaultGenerateFor: const _i3.InputSet(include: const [
        'test/models/dynamic/dynamic.dart',
      ]),
      hideOutput: false),
];
main(List<String> args, [_i9.SendPort sendPort]) async {
  var result = await _i1.run(args, _builders);
  sendPort?.send(result);
}
