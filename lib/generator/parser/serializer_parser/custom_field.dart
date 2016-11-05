part of jaguar_serializer.generator.parser.serializer;

class CustomFieldCodecInfo {
  final String instantiationString;

  CustomFieldCodecInfo(this.instantiationString);
}

class ToFieldCustom implements ToField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  final String instantiationString;

  ToFieldCustom(this.key, this.name, this.type, this.instantiationString);
}

class FromFieldCustom implements FromField {
  final String key;

  final String name;

  /// Type of the field
  final DartTypeWrap type;

  final String instantiationString;

  FromFieldCustom(this.key, this.name, this.type, this.instantiationString);
}

void _parseCustomField(SerializerInfo ret, AnnotationElementWrap annot) {
  if (annot.element is! ConstructorElement) {
    return null;
  }

  if (annot.element.enclosingElement is! ClassElement) {
    return null;
  }

  ClassElementWrap clazz = new ClassElementWrap(annot.element.enclosingElement);

  DefineFieldProcessor defFieldProc = clazz.metadata
      .map((AnnotationElementWrap annotDef) => annotDef.instantiated)
      .firstWhere((annotDef) => annotDef is DefineFieldProcessor,
          orElse: () => null);

  if (defFieldProc is! DefineFieldProcessor) {
    return null;
  }

  InterfaceTypeWrap fieldPross = clazz.allSupertypes
      .map((InterfaceType interface) => new InterfaceTypeWrap(interface))
      .firstWhere(
          (InterfaceTypeWrap interface) => interface.isSame(kFieldProcessor),
          orElse: () => null);

  if (fieldPross is! InterfaceTypeWrap) {
    return null;
  }

  String key = annot.constantValue.getField('field').toSymbolValue();
  ret.customFieldCodecs[key] =
      new CustomFieldCodecInfo(annot.instantiationString);
}

void _collectCustomFields(SerializerInfo ret, ClassElementWrap clazz) {
  clazz.metadata.forEach((annot) => _parseCustomField(ret, annot));
}
