import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'safenum.jser.dart';

class SafeNum {
  @Field(processor: SafeNumProcessor())
  double number;
}

@GenSerializer()
class SafeNumSerializer extends Serializer<SafeNum> with _$SafeNumSerializer {}
