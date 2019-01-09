[![Pub](https://img.shields.io/pub/v/jaguar_serializer_protobuf.svg)](https://pub.dartlang.org/packages/jaguar_serializer_protobuf)
[![Build Status](https://travis-ci.org/Jaguar-dart/jaguar_serializer_protobuf.svg?branch=master)](https://travis-ci.org/Jaguar-dart/jaguar_serializer_protobuf)
[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/jaguar_dart/jaguar)

# jaguar_serializer_protobuf
Protobuf support for jaguar_serializer

# Getting Started

## Install

```yaml
#pubspec.yaml
dependencies:
  jaguar_serializer_protobuf: 
```

## Usage

Import `jaguar_serializer_protobuf`

```dart
import 'package:jaguar_serializer/jaguar_serializer_protobuf.dart';
```

Generate your Dart model from your proto definition with proto compiler.

```shell
protoc --dart_out=. ./person.proto -I=.
```

Once your models are generated, you can use them like this:

```dart
final serializerRepo = ProtoSerializerRepo()
    ..add((data)=>Person.fromBuffer(data), toJson: (data)=>Person.fromJson(data));
```

You can then serialize like this:
```
Person person = Person();
  data.id = 1;
  data.name = 'name';
  data.email = 'name@email.com';
List<int> data = serializerRepo.to(person)  
```
And deserialize like this:
```
Person person2 = serializerRepo.from<Person>(data)
```

You can also enable JSON support if you need to debug your network layer. To do so use the `isJsonFormatEnabled` param of the repo:
```
final serializerJsonRepo = ProtoSerializerRepo(isJsonFormatEnabled: true)
    ..add((data)=>Person.fromBuffer(data), toJson: (data)=>Person.fromJson(data));
Person personJson = serializerJsonRepo.from<Person>('{"1": "name", "2": 1, "3": "name@email.com"}');
```
