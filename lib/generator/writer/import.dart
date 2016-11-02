library jaguar_serializer.generator.writer;

class Writer {
  final String name;

  StringBuffer sb = new StringBuffer();

  Writer(this.name);

  String toString() => sb.toString();
}