part of jaguar_serializer.generator.parser.serializer;

void _collectIgnoreField(SerializerInfo ret, ClassElementWrap clazz) {
  clazz.metadata
      .map((annot) => annot.instantiated)
      .where((value) => value is IgnoreField)
      .forEach((IgnoreField field) {
    String fieldName = MirrorSystem.getName(field.field);
    if (field.encode) {
      ret.ignoreFieldsTo.add(fieldName);
    }

    if (field.decode) {
      ret.ignoreFieldsFrom.add(fieldName);
    }
  });
}

void _collectIgnoreFields(SerializerInfo ret, ClassElementWrap clazz) {
  clazz.metadata
      .map((annot) => annot.instantiated)
      .where((value) => value is IgnoreFields)
      .forEach((IgnoreFields field) {
    if (field.encode) {
      ret.ignoreFieldsTo
          .addAll(field.fields.map((symbol) => MirrorSystem.getName(symbol)));
    }

    if (field.decode) {
      ret.ignoreFieldsFrom
          .addAll(field.fields.map((symbol) => MirrorSystem.getName(symbol)));
    }
  });
}
