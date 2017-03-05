[![Build Status](https://travis-ci.org/Jaguar-dart/jaguar_serializer.svg?branch=master)](https://travis-ci.org/Jaguar-dart/jaguar_serializer)

# jaguar_serializer
Format agnostic Serializer library that can be used in server and client for JSON, mongodb, postgresql, etc


# Getting Started

## Install

`pub global activate jaguar_serializer`

## Add it to your project

```yaml
dependencies:
    jaguar_serializer: ">=1.0.0 <2.0.0"
```

## Simple serializer

Create a file for your model.

```dart
library example.user;

import 'package:jaguar_serializer/serializer.dart';

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
  User createModel() => new User();
}
```

## Generate Serializer

### Configuration file

Jaguar Serializer need a configuration file to know which files have possible Serializer.

On your root directory, declare the `serializer.yaml` file with the following informations.

```yaml
serializers:
- lib/model/user.dart
...
```

### Build
No you can build you serializer running the command

`serializer build` 

or 

`pub run jaguar_serializer:serializer build`

This command will create 'user.g.dart' file with the generated Serializer inside.

### Watch

You can trigger the rebuild each time you do a change in you file by using the `watch` command.

`serializer watch`

## Use Serializer

A Serializer will convert an instance of object to a Map<String, dynamic>, that can be used to apply conversion to JSON, YAML ...

You can directly use the generated Serializer and apply the conversion.
```dart
import 'package:jaguar_serializer/serializer.dart';
import 'model/user.dart';

void main() {
  UserSerializer userSerializer = new UserSerializer();
  
  User user = userSerializer.fromMap({
        'name': 'John',
        'age': 25
      });
  
  print(userSerializer.toMap(user));
}
```

You can also use a JSON repository or implement one.

```dart
import 'package:jaguar_serializer/serializer.dart';
import 'model/user.dart';

void main() {
  SerializerRepo serializer = new JsonRepo()..add(new UserSerializer());
  
  User user = serializer.deserialize("{'name':'John','age': 25}", type: User);
  
  print(serializer.serialize(user));
}
```