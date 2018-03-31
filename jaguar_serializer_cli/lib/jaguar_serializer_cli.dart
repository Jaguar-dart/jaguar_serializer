// Copyright (c) 2017, teja. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library jaguar_serializer_cli;

import 'package:build/build.dart';
import 'src/generator.dart';

Builder jaguarSerializer(BuilderOptions options) => jaguarSerializerPartBuilder(
    header: options.config['header'] as String,
    requireLibraryDirective:
        options.config['require_library_directive'] as bool ?? true);
