library jaguar_serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/serializer.dart';

class JsonRepo extends SerializerRepo {
  JsonRepo({String typeInfoKey: "@t"}) : super(typeInfoKey: typeInfoKey);

  dynamic encode(dynamic object) => JSON.encode(object);

  dynamic decode(dynamic object) => JSON.decode(object);
}
