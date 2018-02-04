# Changelog

## 1.0.0-dev2

- simplify and optimize generated code
- fix processor inside List/Map

*** Breaking Changes ***
- All Serializers are now nullable by default
- Drop Map key processor
- Only `Map<String, dynamic>` can be encode
- `toMap(null)` return null
- `fromMap(null)` return null
- `fromMap({})` return object

## 1.0.0-dev1

- update to dart 2
- support `build.yaml` and `build_runner`

## 0.5.1

- Removed deprecated `processors` field in `GenSerializer` use `processor` 
field in `Property` instead

## 0.5.0

- support disable null check
- deprecate `GenSerializer.processor` fields, FieldProcessor go into `GenSerializer.fields` inside `Property`
- support for default value, `String`, `int`, `double`, `bool`, if a field is non nullable, jaguar will use the default value declared in you object constructor

***Breaking Change***
`EnDecode`, `DecodeOnly`, `EncodeOnly` does not use optional parameter in constructor anymore,

example: `EnDecode({this.alias, bool isNullable, FieldProcessor<T, dynamic> processor, T defaultsTo})`

## 0.4.2
- Better support of ddc

## 0.4.1

- Added docs
- Fixed README

## 0.4.0

***Breaking Changes***
- Generator is now in a separate [package](https://pub.dartlang.org/packages/jaguar_serializer_cli)
- Angular style annotations, only one annotation
```dart
@GenSerializer(
  fields: const {
    'field': const EncodeOnly('f')
  }, 
  ignore: const [
    'ignoreField'
  ], 
  processors: const {
   'dates': const DateTimeProcessor(),
  }, 
  serializers: const [
   FieldSerializer,
])
```

## 0.3.16

- `to`, `from`, `serialize`, `deserialize` methods now handle `null` values correctly

## 0.3.15

- `serialize` and `deserialize` methods now handle `null` values correctly

## 0.3.14

- `SerializerRepo` handles when `type` is `dynamic`

## 0.3.12

- Added `from` and `to` methods to `SerializerRepo`

## 0.3.11

- SerializerRepo now serializes and de-serializes built-in types at the root like `Map`, `List<List>`, etc
- added `addAll` method to `SerializerRepo` to add multiple serializers
- Validation for `RawData` custom field processor

## 0.3.7

- Add builtin `RawData` Processor
- Optimize CustomFieldProcessor

## 0.3.6

- Update `build` package to `>=0.9.3 <0.10.0`

## 0.3.5
- `serializers.yaml` is now optional, Jaguar Serializer will take all dart files under `lib`, `bin`, `example` and `test` folders.
Be careful on big project, `watch` can be slow or take a lot of resources.

## 0.3.4

- Fixed ProvideSerializer for Map fields

## 0.3.3

- Better failure messages when property is an Object or dynamic

## 0.3.2

- Added "exclude by default" feature 

## 0.3.1

- Update `build` (>=0.7.0 <0.8.0)
- `serializer init` command, generate `serializer.yaml`
- fix overrided field in double inside the generated code

## 0.3.0

***New***

- `Repository` system (Json, Yaml)
- embeded type => see typeKey
- Optional parameters for GenSerializer :
    * `bool typeKey (default:true)` if you want to include the type
    * `String modelName` value that will be include as a type.

## 0.1.2

First release.

Contains:

1. Serializer for dart builtin types
2. Custom serializers for fields
3. Nested Map and List serializers

## 0.1.3

- Fixed renaming encode field bug

## 0.1.6

- Null nested objects are not serialized properly
