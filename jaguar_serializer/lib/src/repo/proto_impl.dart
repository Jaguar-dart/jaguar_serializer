import 'package:jaguar_serializer/jaguar_serializer.dart';

class SerializerProtoRepo extends SerializerRepo {
  SerializerProtoRepo({List<Serializer> serializers}) {
    if (serializers is List) addAll(serializers);
  }

  /// Serializes [object] to Dart built-in type
  @override
  dynamic to(dynamic object) {
    final Type type = object.runtimeType;
    final serializer = getByType(type);
    return serializer?.encode(object);
  }

  /// Deserializes Dart built-in object to Dart PODO
  @override
  dynamic from<T>(dynamic object) {
    Serializer ser = getByType(T);
    return ser?.decode(object);
  }

}
