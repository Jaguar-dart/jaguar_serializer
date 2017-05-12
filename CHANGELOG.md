# Changelog

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
