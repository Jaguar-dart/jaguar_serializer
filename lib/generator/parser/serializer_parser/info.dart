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

  final List<FieldTo> to;

  final List<FieldFrom> from;

  SerializerWriteInfo(this.name, this.modelName,
      [this.to = const [], this.from = const []]);

  factory SerializerWriteInfo.FromInfo(SerializerInfo info) {
    List<FieldTo> tos = <FieldTo>[];

    for (ModelField field in info.model.to) {
      if (!info.ignoreFieldsTo.contains(field.name)) {
        String fieldName = field.name;
        String fieldKey = field.name;

        if (info.toRename.containsKey(fieldName)) {
          fieldKey = info.toRename[fieldName];
        }

        tos.add(_parseFieldTo(info, field, fieldKey));
      }
    }

    List<FieldFrom> froms = <FieldFrom>[];

    for (ModelField field in info.model.from) {
      if (!info.ignoreFieldsFrom.contains(field.name)) {
        String fieldName = field.name;
        String fieldKey = field.name;

        if (info.fromRename.containsKey(fieldName)) {
          fieldKey = info.fromRename[fieldName];
        }

        froms.add(_parseFieldFrom(info, field, fieldKey));
      }
    }

    return new SerializerWriteInfo(
        info.name, info.model.model.name, tos, froms);
  }
}
