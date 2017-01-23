part of jaguar_serializer.generator.parser.serializer;

const NamedElement kTypeProvideSerializers =
    const NamedElementImpl.Make('ProvideSerializers', kLibMapSer);

void _collectProviders(SerializerInfo ret, ClassElementWrap clazz) {
  clazz.metadata.forEach((AnnotationElementWrap annot) {
    DartObject instance = annot.constantValue;

    DartTypeWrap type = new DartTypeWrap(instance.type);

    if (!type.compareNamedElement(kTypeProvideSerializers)) {
      return;
    }

    Map<DartObject, DartObject> serializers =
        instance.getField('serializers').toMapValue();
    serializers.forEach((DartObject model, DartObject serializer) {
      DartTypeWrap modelWrap = new DartTypeWrap(model.toTypeValue());
      DartTypeWrap serializerWrap = new DartTypeWrap(serializer.toTypeValue());
      //ret.serializationProviders[modelWrap] = serializerWrap;
    });
  });
}
