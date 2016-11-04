part of jaguar_serializer.generator.parser.serializer;

abstract class ToField {
  String get key;

  String get name;

  /// Type of the field
  DartTypeWrap get type;
}

class ToFieldNormal implements ToField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  ToFieldNormal(this.key, this.name, this.type);
}

class ToFieldSerialized implements ToField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  final DartTypeWrap serializer;

  ToFieldSerialized(this.key, this.name, this.type, this.serializer);
}

abstract class FromField {
  String get key;

  String get name;

  /// Type of the field
  DartTypeWrap get type;
}

class FromFieldNormal implements FromField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  FromFieldNormal(this.key, this.name, this.type);
}

class FromFieldSerialized implements FromField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  final DartTypeWrap serializer;

  FromFieldSerialized(this.key, this.name, this.type, this.serializer);
}
