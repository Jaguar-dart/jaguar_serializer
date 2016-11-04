part of jaguar_serializer.generator.internal.element;

class InterfaceTypeWrap implements NamedElement {
  final InterfaceType _wrapped;

  InterfaceTypeWrap(this._wrapped);

  String get name => _wrapped.name;

  String get libraryName => _wrapped.element.library.name;

  bool isSame(NamedElement el) {
    return name == el.name && libraryName == el.libraryName;
  }

  List<DartTypeWrap> get typeArguments =>
      _wrapped.typeArguments.map((arg) => new DartTypeWrap(arg)).toList();

  List<TypeParameterElement> get typeParameters => _wrapped.typeParameters;
}

class ClassElementWrap implements NamedElement {
  final ClassElement _wrapped;

  ClassElementWrap(this._wrapped);

  String get name => _wrapped.name;

  String get libraryName => _wrapped.library.name;

  List<InterfaceType> get allSupertypes => _wrapped.allSupertypes;

  bool isSameAs(ClassElementWrap other) {
    return name == other.name && libraryName == other.libraryName;
  }

  bool compareNames(NamedElement first) {
    return first.name == name && first.libraryName == libraryName;
  }

  List<FieldElement> get fields => _wrapped.fields;

  Iterable<AnnotationElementWrap> get metadata =>
      _wrapped.metadata.map((annot) => new AnnotationElementWrap(annot));
}
