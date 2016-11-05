part of jaguar_serializer.generator.parser.serializer;

class SerializerInfo {
  String name;

  Map<String, String> fromRename = {};

  Map<String, String> toRename = {};

  Set<String> ignoreFieldsTo = new Set<String>();

  Set<String> ignoreFieldsFrom = new Set<String>();

  Map<String, CustomFieldCodecInfo> customFieldCodecs = {};

  Map<DartTypeWrap, DartTypeWrap> serializationProviders = {};

  Model model = new Model();

  SerializerInfo(this.name);
}

class SerializerWriteInfo {
  final String name;

  final String modelName;

  final List<ToField> to;

  final List<FromField> from;

  SerializerWriteInfo(this.name, this.modelName,
      [this.to = const [], this.from = const []]);

  factory SerializerWriteInfo.FromInfo(SerializerInfo info) {
    List<ToField> tos = <ToField>[];

    for (ModelField field in info.model.to) {
      if (!info.ignoreFieldsTo.contains(field.name)) {
        String fieldName = field.name;
        String fieldKey = field.name;

        if (info.toRename.containsKey(fieldName)) {
          fieldKey = info.toRename[fieldName];
        }

        if (info.customFieldCodecs.containsKey(fieldName)) {
          tos.add(new ToFieldCustom(fieldKey, fieldName, field.type,
              info.customFieldCodecs[fieldName].instantiationString));
        } else if (field.type.isBuiltin) {
          tos.add(new ToFieldNormal(fieldKey, fieldName, field.type));
        } else {
          DartTypeWrap ser;
          info.serializationProviders
              .forEach((DartTypeWrap type, DartTypeWrap serializer) {
            if (type.compare(field.type.name, field.type.libraryName)) {
              ser = serializer;
            }
          });
          if (ser is DartTypeWrap) {
            tos.add(
                new ToFieldSerialized(fieldKey, fieldName, field.type, ser));
          } else {
            throw new Exception(
                "Cannot find a serializer for ${field.type} ...");
          }
        }
      }
    }

    List<FromField> froms = <FromField>[];

    for (ModelField field in info.model.from) {
      if (!info.ignoreFieldsFrom.contains(field.name)) {
        String fieldName = field.name;
        String fieldKey = field.name;

        if (info.toRename.containsKey(fieldName)) {
          fieldKey = info.fromRename[fieldName];
        }

        if (info.customFieldCodecs.containsKey(fieldName)) {
          froms.add(new FromFieldCustom(fieldKey, fieldName, field.type,
              info.customFieldCodecs[fieldName].instantiationString));
        } else if (field.type.isBuiltin) {
          froms.add(new FromFieldNormal(fieldKey, fieldName, field.type));
        } else {
          DartTypeWrap ser;
          info.serializationProviders
              .forEach((DartTypeWrap type, DartTypeWrap serializer) {
            if (type.compare(field.type.name, field.type.libraryName)) {
              ser = serializer;
            }
          });
          if (ser is DartTypeWrap) {
            froms.add(
                new FromFieldSerialized(fieldKey, fieldName, field.type, ser));
          } else {
            throw new Exception(
                "Cannot find a serializer for ${field.type} ...");
          }
        }
      }
    }

    return new SerializerWriteInfo(
        info.name, info.model.model.name, tos, froms);
  }
}
