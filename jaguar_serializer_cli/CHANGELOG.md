# Changelog

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
