import 'package:build_runner/build_runner.dart' as _i1;
import 'package:build_test/builder.dart' as _i2;
import 'package:build_config/build_config.dart' as _i3;
import 'package:jaguar_serializer_cli/jaguar_serializer_cli.dart' as _i4;
import 'package:build_modules/builders.dart' as _i5;
import 'package:build_web_compilers/builders.dart' as _i6;
import 'package:build/build.dart' as _i7;
import 'dart:convert' as _i8;
import 'dart:isolate' as _i9;

final _builders = [
  _i1.apply('jaguar_serializer_cli|jaguar_serializer_cli',
      [_i4.jaguarSerializer], _i1.toRoot(),
      hideOutput: false),
];
main(List<String> args, [_i9.SendPort sendPort]) async {
  var result = await _i1.run(args, _builders);
  sendPort?.send(result);
}
