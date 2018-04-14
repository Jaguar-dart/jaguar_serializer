[![Build Status](https://travis-ci.org/Jaguar-dart/jaguar_serializer.svg?branch=master)](https://travis-ci.org/Jaguar-dart/jaguar_serializer)

# jaguar_serializer
Format agnostic Serializer library that can be used in server and client for JSON, mongodb, postgresql, etc

- [Documentations](https://github.com/Jaguar-dart/jaguar_serializer/wiki)

# Getting Started

## Install


```yaml
#pubspec.yaml
dependencies:
  jaguar_serializer: ^1.0.0-dev1

dev_dependencies:
  build_runner: ^0.8.0
  jaguar_serializer_cli: ^1.0.0-dev1
```

## Simple serializer

Create a file for your model.

```dart
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user.g.dart';
```

Create you model.

```dart
/// User model
class User {
  String name;
  int age;
}
```

Declare a Serializer for your model

```dart
@GenSerializer()
class UserJsonSerializer extends Serializer<User> with _$UserJsonSerializer {
}
```

## Generate Serializer

### Build
Now you can build you serializer running the command

`pub run build_runner build` 

This command will create 'user.g.dart' file with the generated Serializer inside.

### Watch

You can trigger the rebuild each time you do a change in you file by using the `watch` command.

`pub run build_runner watch`

## Use Serializer

A Serializer will convert an instance of `Object` to a `Map<String, dynamic>`, that can be used to apply conversion to JSON, YAML ...

You can directly use the generated Serializer and apply the conversion.
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

You can also use a JSON repository or implement one.

```dart
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'model/user.dart';

void main() {
  final jsonRepository = new JsonRepo()..add(new UserSerializer());
  
  User user = jsonRepository.deserialize('{"name":"John","age": 25}', type: User);
  
  print(jsonRepository.serialize(user));
}
```
