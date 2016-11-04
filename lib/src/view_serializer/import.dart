library serializer.view_serializer;

import 'package:jaguar_serializer/src/map_serializer/import.dart';

abstract class SerializableToView {
  MapSerializer get viewSerializer;
}