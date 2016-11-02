part of jaguar_serializer.generator.internal.element;

class DartTypeWrap {
  final DartType _wrapped;

  DartTypeWrap(this._wrapped);

  bool get isVoid => _wrapped.isVoid;

  bool get isDartAsyncFuture => _wrapped.isDartAsyncFuture;

  bool get isDynamic => _wrapped.isDynamic;

  bool get isObject => _wrapped.isObject;

  bool get isInt => compare(kIntTypeName, kCoreLibraryName);

  bool get isDouble => compare(kDoubleTypeName, kCoreLibraryName);

  bool get isNum => compare(kNumTypeName, kCoreLibraryName);

  bool get isBool => compare(kBoolTypeName, kCoreLibraryName);

  bool get isString => compare(kStringTypeName, kCoreLibraryName);

  bool get isBuiltin => isInt || isDouble || isNum || isBool || isString;

  String get displayName => _wrapped.displayName;

  String get name => _wrapped?.name;

  String get libraryName => _wrapped?.element?.library?.name;

  bool isType(DartTypeWrap other) {
    if (libraryName != other.libraryName) {
      return false;
    }

    if (name != other.name) {
      return false;
    }

    return true;
  }

  fghfgh() {
    _wrapped.element;
  }

  static const String kCoreLibraryName = 'dart.core';

  static const String kIntTypeName = 'int';

  static const String kDoubleTypeName = 'double';

  static const String kNumTypeName = 'num';

  static const String kBoolTypeName = 'bool';

  static const String kStringTypeName = 'String';

  bool compare(String aName, String aLibraryName) =>
      aName == name && aLibraryName == libraryName;

  String toString() => '$libraryName.$name';

  ClassElementWrap get clazz => new ClassElementWrap(_wrapped.element);
}