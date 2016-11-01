library serializer.view_serializer;

import 'package:serialize/src/map_serializer/import.dart';

abstract class SerializableToView {
  MapSerializer get viewSerializer;
}