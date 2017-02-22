library jaguar_serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/serializer.dart';

class SerializerJson extends Serializer {
  SerializerJson()
      : super((dynamic object) => JSON.encode(object),
            (String data) => JSON.decode(data));
}
