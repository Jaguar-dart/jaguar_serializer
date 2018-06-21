# Changelog

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

## 1.0.0-dev8

- fix flutter --release build
- support generics

## 1.0.0-dev7

- fix issues on static and private field

## 1.0.0-dev6

- update source_gen and build

## 1.0.0-dev5

- Dart2 compliance
    + better typing
    + force cast in generated code

## 1.0.0-dev3

- we now support final field deserialization
- `createModel()` in `Serializer` class is now deprecated, it will be remove in the final release of `1.0.0`

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

## 0.5.2

- update `build`
- remove deprecated `processors` field support

## 0.5.1

- `version` and `help` commands for CLI

## 0.5.0

- Angular-like annotation to specify `GenSerializer`
