library serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/src/serializer/import.dart';

class SerializerJson extends Serializer {
  SerializerJson()
      : super((dynamic object) => JSON.encode(convertKeysToString(object)),
            (String data) => JSON.decode(data));
}
