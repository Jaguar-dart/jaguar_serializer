[![Pub](https://img.shields.io/pub/v/jaguar_serializer.svg)](https://pub.dartlang.org/packages/jaguar_serializer)
[![Build Status](https://travis-ci.org/Jaguar-dart/jaguar_serializer.svg?branch=master)](https://travis-ci.org/Jaguar-dart/jaguar_serializer)	 [![Build Status](https://travis-ci.org/Jaguar-dart/jaguar_serializer.svg?branch=master)](https://travis-ci.org/Jaguar-dart/jaguar_serializer)
[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/jaguar_dart/jaguar)

# jaguar_serializer
Format agnostic Serializer library that can be used in vm, browser and flutter for JSON, mongodb, postgresql, etc

- [Documentations](https://github.com/Jaguar-dart/jaguar_serializer/wiki)

# Getting Started

## Install

```yaml
#pubspec.yaml
dependencies:
  jaguar_serializer: 

dev_dependencies:
  build_runner: 
  jaguar_serializer_cli: 
```

## Simple serializer

Import `jaguar_serializer`

```dart
import 'package:jaguar_serializer/jaguar_serializer.dart';
```

Create your model.

```dart
/// User model
class User {
  String name;
  int age;
}
```

Declare a Serializer for your model.

```dart
@GenSerializer()
class UserJsonSerializer extends Serializer<User> with _$UserJsonSerializer {
}
```

Include the generated serializer functionality.

````dart
part 'user.jser.dart';
````

## Generate Serializer

### Build
Now you can build you serializer running the command

```
pub run build_runner build

# flutter
flutter packages pub run build_runner build
``` 

This command will generate `_$UserJsonSerializer` in file 'user.jser.dart'.

## Use Serializer

A Serializer will serialize and deserialize between your model and `Map<String, dynamic>`, that can be used to apply 
conversion to JSON, YAML, XML, etc.

```dart
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'model/user.dart';

void main() {
  final userSerializer = new UserJsonSerializer();
  
  User user = userSerializer.fromMap({
        'name': 'John',
        'age': 25
      });
  
  print(userSerializer.toMap(user));
}
```

## Serializer repository

You can also use a JSON repository or implement one.

```dart
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'model/user.dart';

void main() {
  final jsonRepository = new JsonRepo()..add(new UserSerializer());
  
  User user = jsonRepository.from<User>('{"name":"John","age": 25}');
  
  print(jsonRepository.serialize(user));
}
```
