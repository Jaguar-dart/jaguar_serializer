library jaguar_serializer.generator.helpers;

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'package:jaguar_serializer_cli/src/info/info.dart';
import 'package:jaguar_serializer_cli/src/info/info.dart' as $info;
import 'package:jaguar_serializer_cli/src/utils/string.dart';
import 'package:jaguar_serializer_cli/src/utils/type_checkers.dart';
import 'package:jaguar_serializer_cli/src/utils/exceptions.dart';

/// Instantiates [GenSerializer] from [DartObject]
class AnnotationParser {
  final ConstantReader obj;

  final ClassElement element;

  /// Model type
  DartType modelType;

  ClassElement modelClass;

  /// Should fields be included by default
  bool includeByDefault;

  final Map<String, PropertyAccessorElement> getters =
      <String, PropertyAccessorElement>{};

  final Map<String, PropertyAccessorElement> setters =
      <String, PropertyAccessorElement>{};

  final Map<String, $info.Field> fields = <String, $info.Field>{};

  Map<InterfaceType, ClassElement> providers = {};

  bool globalNullable;

  AnnotationParser(this.element, this.obj);

  SerializerInfo parse() {
    globalNullable = obj.peek('nullableFields')?.boolValue ?? false;

    _parseSerializers();
    _parseModelType();
    includeByDefault = obj.peek('includeByDefault').boolValue;
    _parseIgnore();
    _parseFields();
    _parseFieldFormatters();
    // TODO _makeCtor(modelType.element as ClassElement, ret.model);
    return new SerializerInfo(element.name, modelClass.displayName, fields);
  }

  /// Parses [modelType] of the Serializer
  void _parseModelType() {
    if (!isSerializer.isSuperTypeOf(element.type)) {
      throw new JCException('Serializers must be extended from `Serializer`!');
    }

    InterfaceType i = element.allSupertypes
        .firstWhere((InterfaceType i) => isSerializer.isExactly(i.element));
    modelType = i.typeArguments.first;
    if (modelType.isDynamic) throw new JCException('Model cannot be dynamic!');
    modelClass = modelType.element as ClassElement;

    bool isNotStaticOrPrivate(PropertyAccessorElement e) =>
        !e.isStatic && !e.isPrivate;

    final accessors = <PropertyAccessorElement>[];
    accessors.addAll(modelClass.accessors.where(isNotStaticOrPrivate));
    for (InterfaceType i in modelClass.allSupertypes) {
      accessors.addAll(i.accessors.where(isNotStaticOrPrivate));
    }

    for (PropertyAccessorElement field in accessors) {
      String name = field.displayName;
      if (name == 'runtimeType') continue;
      if (name == 'hashCode') continue;

      InterfaceType type;
      bool dontEncode = false;
      bool dontDecode = false;

      if (field.isGetter) {
        getters[name] = field;
        type = field.returnType as InterfaceType;
      } else {
        dontEncode = true;
      }

      if (field.isSetter) {
        setters[field.name] = field;
        type = field.type.parameters.first.type as InterfaceType;
      } else {
        dontDecode = true;
      }

      DartObject annot = field.metadata
          .firstWhere(
              (ElementAnnotation a) =>
                  isProperty.isSuperOf(a.computeConstantValue().type.element),
              orElse: () => null)
          ?.constantValue;

      String encodeTo = name;
      String decodeFrom = name;
      bool nullable = globalNullable;
      String defaultValue;
      bool fromConstructor;
      if (annot != null) {
        dontEncode =
            annot.getField('dontEncode').toBoolValue() ? true : dontEncode;
        dontDecode =
            annot.getField('dontDecode').toBoolValue() ? true : dontDecode;

        encodeTo = annot.getField('encodeTo')?.toStringValue() ?? encodeTo;
        decodeFrom =
            annot.getField('decodeFrom')?.toStringValue() ?? decodeFrom;

        nullable = annot.getField('isNullable').toBoolValue() ?? nullable;
        defaultValue = _parseFieldDefaultValue(annot.getField('defaultsTo'));
        fromConstructor = annot.getField('valueFromConstructor').toBoolValue();
      }

      if (includeByDefault || annot != null) {
        fields[name] = new $info.Field(
          name: name,
          dontEncode: dontEncode,
          dontDecode: dontDecode,
          type: type,
          encodeTo: encodeTo,
          decodeFrom: decodeFrom,
          processor: null, // TODO
          provider: null, // TODO
          isNullable: nullable,
          defaultValue: defaultValue,
          fromConstructor: fromConstructor,
        );
      }
    }

    /* TODO
    modelClass.fields
        .where((f) => f.isFinal && !f.isStatic && !f.isPrivate)
        .forEach((FieldElement f) {
      mod.addFrom(new $info.Field(f.displayName, f.type as InterfaceType,
          isFinal: true));
    });
    */
  }

  void _parseIgnore() {
    for (DartObject ig in obj.peek('ignore').listValue) {
      String fieldName = _mapToString(ig);
      fields[fieldName] = new $info.Field(
          name: fieldName,
          dontEncode: true,
          dontDecode: true,
          type: null,
          encodeTo: null,
          decodeFrom: null,
          processor: null,
          provider: null,
          isNullable: null,
          defaultValue: null,
          fromConstructor: null);
    }
  }

  void _parseFieldFormatters() {
    /* TODO
    final format = obj.peek('fieldFormat')?.stringValue;
    fieldFormatter = (str) => str;
    if (format == FieldFormat.camelCase) {
      fieldFormatter = toCamelCase;
    } else if (format == FieldFormat.snakeCase) {
      fieldFormatter = toSnakeCase;
    } else if (format == FieldFormat.kebabCase) {
      fieldFormatter = toKebabCase;
    }
    */
  }

  void _parseSerializers() {
    final List<DartObject> list = obj.peek('serializers')?.listValue ?? [];
    list.map((DartObject obj) => obj.toTypeValue()).forEach((DartType t) {
      if (!isSerializer.isSuperTypeOf(t)) {
        throw new JCException('serializers must be sub-type of Serializer!');
      }

      final ClassElement v = t.element;
      final InterfaceType i = v.allSupertypes
          .where((InterfaceType i) => isSerializer.isExactly(i.element))
          .first;

      final DartType key = i.typeArguments[0];
      providers[key as InterfaceType] = v;
    });
  }

  /// Parses fields of the GenSerializer
  void _parseFields() {
    Map<DartObject, DartObject> map = obj.peek('fields')?.mapValue;
    for (DartObject dKey in map.keys)
      _processField(dKey.toStringValue(), map[dKey]);
  }

  void _processField(String key, DartObject dV) {
    FieldProcessorInfo processor;
    if (_notNull(dV.getField('processor'))) {
      final pField = dV.getField('processor').type;
      final supertype = (pField.element as ClassElement).allSupertypes.last;
      final deserializedType = supertype.typeArguments[0].displayName;
      final serializedType = supertype.typeArguments[1].displayName;
      processor = new FieldProcessorInfo(
          pField.displayName, serializedType, deserializedType);
      // TODO verify if it is valid FieldProcessor type
    }

    fields[key] = new $info.Field(
      name: key,
      type: null, // TODO
      dontEncode: dV.getField('dontEncode')?.toBoolValue(),
      dontDecode: dV.getField('dontDecode')?.toBoolValue(),
      encodeTo: _getStringField(dV, 'encodeTo') ?? key,
      decodeFrom: _getStringField(dV, 'decodeFrom') ?? key,
      processor: processor,
      provider: null, // TODO
      isNullable: dV.getField('isNullable')?.toBoolValue() ?? globalNullable,
      defaultValue: _parseFieldDefaultValue(dV.getField('defaultsTo')),
      fromConstructor:
          dV.getField('valueFromConstructor')?.toBoolValue() ?? false,
    );
  }

  /* TODO
  void _makeCtor(ClassElement el, Model model) {
    ConstructorElement ctor = el.unnamedConstructor;
    if (ctor == null) {
      throw new JCException(
          "The class `${el.name}` has no default constructor.");
    }
    for (final arg in ctor.parameters) {
      final field = model.getFrom(arg.name);
      if (field?.isFinal == true) {
        if (arg.parameterKind == ParameterKind.NAMED) {
          model.ctorNamedArguments.add(arg);
        } else {
          model.ctorArguments.add(arg);
        }
      }
    }
  }
  */
}

bool _notNull(DartObject obj) => obj != null && obj.isNull == false;

String _getStringField(DartObject v, String name) =>
    v.getField(name)?.toStringValue();

String _mapToString(DartObject v) => v?.toStringValue();

String _parseFieldDefaultValue(DartObject dV) {
  if (dV == null) return null;
  print(dV.type);
  if (isString.isExactlyType(dV.type)) {
    return '"${dV.toStringValue()}"';
  } else if (isBool.isExactlyType(dV.type)) {
    return dV.toBoolValue().toString();
  } else if (isDouble.isExactlyType(dV.type)) {
    return dV.toDoubleValue().toString();
  } else if (isInt.isExactlyType(dV.type)) {
    return dV.toIntValue().toString();
  } else {
    // TODO more specific
    throw new JCException("Invalid value for `defaultsTo`");
  }
}
