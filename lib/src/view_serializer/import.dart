library serializer.view_serializer;

import 'package:serialize/src/map_serializer/import.dart';

class EncodeField {
  final String field;

  final String as;

  const EncodeField(this.field, {this.as});
}

class DecodeField {
  final String field;

  final String from;

  const DecodeField(this.field, {this.from});
}

class EnDecodeField {
  final Symbol field;

  final String fromAndAs;

  const EnDecodeField(this.field, {this.fromAndAs});
}

abstract class SerializableToView {
  MapSerializer get viewSerializer;
}

class MakeViewSerializer {
  const MakeViewSerializer();
}