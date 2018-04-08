import '../base/base.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'complex.g.dart';

class Complex {
  List<num> nums;
  List<String> strings;
  List<bool> bools;
  List<int> ints;
  List<double> doubles;

  //List<DateTime> dates; //TODO: processField inside List or Map
  List<WithIgnore> ignores;
  Map<String, num> numSet;
  Map<String, String> stringSet;
  Map<String, bool> boolSet;
  Map<String, int> intSet;
  Map<String, double> doubleSet;

  // Map<String, DateTime> dateSet;//TODO: processField inside List or Map
  Map<String, WithIgnore> ignoreSet;
  Map<String, List<String>> listInnerMap1;
  Map<String, dynamic> dynamicMap;
  List dynamicList;
}

@GenSerializer(fields: const {
  'dynamicMap': const Property<dynamic>(processor: const RawData()),
  'dynamicList': const Property<dynamic>(processor: const RawData()),
}, serializers: const [
  WithIgnoreSerializer,
])
class ComplexSerializer extends Serializer<Complex> with _$ComplexSerializer {}
