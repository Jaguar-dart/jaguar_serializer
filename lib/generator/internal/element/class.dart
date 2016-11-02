part of  jaguar_serializer.generator.internal.element;

class ClassElementWrap implements NamedElement {
  final ClassElement _wrapped;

  ClassElementWrap(this._wrapped);

  String get name => _wrapped.name;

  String get libraryName => _wrapped.library.name;

  bool isSameAs(ClassElementWrap other) {
    return name == other.name && libraryName == other.libraryName;
  }

  bool compareNames(ClassElementWrap first, ClassElementWrap second) {
    return first.name == second.name && first.libraryName == second.libraryName;
  }
}