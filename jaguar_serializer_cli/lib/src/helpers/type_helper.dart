part of jaguar_serializer.generator.helpers;

const isSerializer = const TypeChecker.fromRuntime(Serializer);

const isGenSerializer = const TypeChecker.fromRuntime(GenSerializer);

const isList = const TypeChecker.fromRuntime(List);

const isMap = const TypeChecker.fromRuntime(Map);

const isString = const TypeChecker.fromRuntime(String);

const isInt = const TypeChecker.fromRuntime(int);

const isDouble = const TypeChecker.fromRuntime(double);

const isNum = const TypeChecker.fromRuntime(num);

const isBool = const TypeChecker.fromRuntime(bool);

const isProperty = const TypeChecker.fromRuntime(Field);

const isFieldProcessor = const TypeChecker.fromRuntime(FieldProcessor);

bool isBuiltin(DartType type) {
  if (isString.isExactlyType(type)) return true;
  if (isInt.isExactlyType(type)) return true;
  if (isDouble.isExactlyType(type)) return true;
  if (isNum.isExactlyType(type)) return true;
  if (isBool.isExactlyType(type)) return true;

  return false;
}
