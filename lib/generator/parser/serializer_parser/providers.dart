part of jaguar_serializer.generator.parser.serializer;

void _collectProviders(SerializerInfo ret, ClassElementWrap clazz) {
  clazz.metadata.forEach((AnnotationElementWrap annot) {
    DartObject instance = annot.constantValue;

    DartTypeWrap type = new DartTypeWrap(instance.type);

    if (!type.compare('ProvideSerializers', kLibMapSer)) {
      return;
    }

    Map<DartObject, DartObject> serializers =
        instance.getField('serializers').toMapValue();
    serializers.forEach((DartObject model, DartObject serializer) {
      DartTypeWrap modelWrap = new DartTypeWrap(model.toTypeValue());
      DartTypeWrap serializerWrap = new DartTypeWrap(serializer.toTypeValue());
      ret.serializationProviders[modelWrap] = serializerWrap;
    });
  });
}
