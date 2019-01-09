import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'field_annot.jser.dart';

class FieldAnnot {
  @Alias('f')
  String field;
}

@GenSerializer()
class FieldAnnotSerializer extends Serializer<FieldAnnot>
    with _$FieldAnnotSerializer {}
