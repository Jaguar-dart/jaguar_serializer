import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'name_formatter.jser.dart';

String sampleFormatter(String input) => '@$input';

class Model {
  String oneField;
  String twoField;
}

@GenSerializer(nameFormatter: toSnakeCase)
class ModelSerializer extends Serializer<Model> with _$ModelSerializer {}

@GenSerializer(nameFormatter: sampleFormatter)
class ModelSerializerCustomFormat extends Serializer<Model>
    with _$ModelSerializerCustomFormat {}
