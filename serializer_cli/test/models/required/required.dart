import 'package:meta/meta.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'required.jser.dart';

class Foo {
  String bar;

  Foo({@required this.bar});

  bool operator ==(other) {
    if (other is Foo) return bar == other.bar;
    return false;
  }

  String toString() => FooSerializer().toMap(this).toString();

  int get hashCode => 0;
}

@GenSerializer()
class FooSerializer extends Serializer<Foo> with _$FooSerializer {}
