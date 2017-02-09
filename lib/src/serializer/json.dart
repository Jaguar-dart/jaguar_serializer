library serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/src/serializer/import.dart';

class SerializerJson extends Serializer {
  SerializerJson()
      : super((Object object) => JSON.encode(object),
            (String data) => JSON.decode(data));
}
