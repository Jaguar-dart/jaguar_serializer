part of jaguar_serializer.generator.parser.serializer;

void _collectFieldsMetadata(SerializerInfo ret, ClassElementWrap clazz) {
  clazz.metadata.forEach((annot) {
    //TODO validate field and key
    dynamic instance = annot.instantiated;
    if (instance is EncodeField) {
      final String fieldName = MirrorSystem.getName(instance.field);
      ret.toRename[fieldName] = instance.as;
    } else if (instance is EncodeFields) {
      instance.fields.forEach((Symbol field, String key) {
        final String fieldName = MirrorSystem.getName(field);
        ret.toRename[fieldName] = key;
      });
    } else if (instance is DecodeField) {
      final String fieldName = MirrorSystem.getName(instance.field);
      ret.fromRename[fieldName] = instance.from;
    } else if (instance is DecodeFields) {
      instance.fields.forEach((Symbol field, String key) {
        final String fieldName = MirrorSystem.getName(field);
        ret.fromRename[fieldName] = key;
      });
    } else if (instance is EnDecodeField) {
      final String fieldName = MirrorSystem.getName(instance.field);
      ret.toRename[fieldName] = instance.asAndFrom;
      ret.fromRename[fieldName] = instance.asAndFrom;
    } else if (instance is EnDecodeFields) {
      instance.fields.forEach((Symbol field, String key) {
        final String fieldName = MirrorSystem.getName(field);
        ret.toRename[fieldName] = key;
        ret.fromRename[fieldName] = key;
      });
    }
  });
}
