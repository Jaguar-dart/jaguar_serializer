# Changelog

## 2.2.8

+ Fixed serializer generated constructor bug

## 2.2.1

+ Fixes when `FieldProcessor`'s `FromType` is `dynamic`

## 2.2.0

+ Dart 2 stable


## 2.1.24

+ `FieldProcessor`

## 2.1.18

+ Immutable fix

## 2.1.17

+ Fix for dart-dev64.1

## 2.1.16

+ dynamic field

## 2.1.15

+ Bug fix: [Final non-nullable contructor](https://github.com/Jaguar-dart/jaguar_serializer/issues/144)

## 2.1.14

+ Fixed bug when source is `Map<dynamic, dynamic>`

## 2.1.10

+ Minor bug fixes

## 2.1.9

+ Minor bug fixes

## 2.1.8

+ Support enums

## 2.1.5

+ Bug fix for `Field` annotation directly on model class

## 2.0.3

+ `Set` is not serializable

## 2.0.2

+ Fixed for recursive models

## 2.0.0

- fix flutter --release build
- support generics
- fix issues on static and private field
- update source_gen and build
- Dart2 compliance
    + better typing
    + force cast in generated code
- we now support final field deserialization
- `createModel()` in `Serializer` class is now deprecated, it will be remove in the final release of `1.0.0`
- simplify and optimize generated code
- fix processor inside List/Map
- support `build.yaml` and `build_runner`

*** Breaking Changes ***
- All Serializers are now nullable by default
- Drop Map key processor
- Only `Map<String, dynamic>` can be encode
- `toMap(null)` return null
- `fromMap(null)` return null
- `fromMap({})` return object


## 0.5.2

- update `build`
- remove deprecated `processors` field support

## 0.5.1

- `version` and `help` commands for CLI

## 0.5.0

- Angular-like annotation to specify `GenSerializer`
