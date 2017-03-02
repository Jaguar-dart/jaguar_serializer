library serialize.generator.generator;

import 'package:build/build.dart' as _build;

import 'package:jaguar_serializer/generator/phase/phase.dart';

watch() {
  _build.watch(phaseGroup(), deleteFilesByDefault: true);
}

build() {
  _build.build(phaseGroup(), deleteFilesByDefault: true);
}

/// shoud we keep this ?
start(List<String> args) {
  if (args.length > 0) {
    if (args[0] == 'watch') {
      watch();
    } else if (args[0] == 'build') {
      build();
    } else {
      print("Invalid command!");
    }
  } else {
    print("Invalid command!");
  }
}
