part of jaguar_serializer.generator.parser.serializer;

const NamedElement kTypeProvideSerializers =
    const NamedElementImpl.Make('ProvideSerializer', kLibAnnotations);

void _collectProviders(SerializerInfo ret, ClassElementWrap clazz) {
  clazz.metadata.forEach((AnnotationElementWrap annot) {
    DartObject instance = annot.constantValue;

    DartTypeWrap type = new DartTypeWrap(instance.type);

    if (!type.compareNamedElement(kTypeProvideSerializers)) {
      return;
    }

    DartTypeWrap modelWrap =
        new DartTypeWrap(instance.getField('field').toTypeValue());
    DartTypeWrap serializerWrap =
        new DartTypeWrap(instance.getField('serializer').toTypeValue());
    ret.serializationProviders[modelWrap] = serializerWrap;
  });
}
