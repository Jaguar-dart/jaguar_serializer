/*
import '../base/base.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'complex.jser.dart';

class WithIgnore {
  String a;
  String secret;

  WithIgnore([this.a, this.secret]);
}

@GenSerializer(ignore: const ['secret'])
class WithIgnoreSerializer extends Serializer<WithIgnore>
    with _$WithIgnoreSerializer {}

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
  'dynamicMap': const Field<dynamic>(processor: const RawData()),
  'dynamicList': const Field<dynamic>(processor: const RawData()),
}, serializers: const [
  WithIgnoreSerializer,
])
class ComplexSerializer extends Serializer<Complex> with _$ComplexSerializer {}

class DataResponse<T> {
  List<T> allData = <T>[];
}

@GenSerializer(fields: const {
  'allData': const EnDecode(processor: const DataResponseProcessor())
})
class DataResponseJsonSerializer extends Serializer<DataResponse>
    with _$DataResponseJsonSerializer {}

class DataResponseProcessor implements FieldProcessor<List, String> {
  const DataResponseProcessor();

  List deserialize(String object) {
    final l = object?.split(",");
    return l?.map((s) => num.tryParse(s) ?? s)?.toList();
  }

  String serialize(List allObjects) => allObjects?.map((s) => '$s')?.join(',');
}
*/
