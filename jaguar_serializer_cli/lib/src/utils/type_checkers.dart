import 'package:source_gen/source_gen.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:analyzer/dart/element/type.dart';

const isSerializer = const TypeChecker.fromRuntime(Serializer);

const isGenSerializer = const TypeChecker.fromRuntime(GenSerializer);

const isList = const TypeChecker.fromRuntime(List);

const isMap = const TypeChecker.fromRuntime(Map);

const isSet = const TypeChecker.fromRuntime(Set);

const isString = const TypeChecker.fromRuntime(String);

const isInt = const TypeChecker.fromRuntime(int);

const isDouble = const TypeChecker.fromRuntime(double);

const isNum = const TypeChecker.fromRuntime(num);

const isBool = const TypeChecker.fromRuntime(bool);

const isProperty = const TypeChecker.fromRuntime(Field);

const isPassProcessor = const TypeChecker.fromRuntime(PassProcessor);

const isFieldProcessor = const TypeChecker.fromRuntime(FieldProcessor);

const isDateTime = const TypeChecker.fromRuntime(DateTime);

const isDuration = const TypeChecker.fromRuntime(Duration);

bool isBuiltin(DartType type) {
  if (isString.isExactlyType(type)) return true;
  if (isInt.isExactlyType(type)) return true;
  if (isDouble.isExactlyType(type)) return true;
  if (isNum.isExactlyType(type)) return true;
  if (isBool.isExactlyType(type)) return true;

  return false;
}
