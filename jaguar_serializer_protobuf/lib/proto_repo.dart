import 'dart:typed_data';

import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';

typedef T FromProtoBuf<T>(dynamic data);

class ProtoCodecRepo extends ProtoSerializerRepo
    implements CodecRepo<Uint8List> {

  ProtoCodecRepo({isJsonFormatEnabled = false})
      : super(isJsonFormatEnabled: isJsonFormatEnabled);

  @override
  decode<T>(Uint8List object) {
    return from<T>(object);
  }

  @override
  List<T> decodeList<T>(Uint8List object) {
    return from<T>(object);
  }

  @override
  T decodeOne<T>(Uint8List object) {
    return from<T>(object);
  }

  @override
  Uint8List encode(object) {
    return to(object);
  }
}

class ProtoSerializerRepo extends SerializerRepo {
  ProtoSerializerRepo({this.isJsonFormatEnabled = false});

  final bool isJsonFormatEnabled;
  final Map<dynamic, FromProtoBuf> bufferCalls = {};
  final Map<dynamic, FromProtoBuf> jsonCalls = {};

  void add<T>(FromProtoBuf<T> toBuffer, {FromProtoBuf<T> toJson}) {
    bufferCalls[T] = toBuffer;
    if (toJson != null) {
      jsonCalls[T] = toJson;
    }
  }

  void addAll(Map<dynamic, FromProtoBuf> toBuffer,
      {Map<dynamic, FromProtoBuf> toJson}) {
    bufferCalls.addAll(toBuffer);
    if (toJson != null) {
      jsonCalls.addAll(toJson);
    }
  }

  void clear() {
    bufferCalls.clear();
    jsonCalls.clear();
  }

  /// Serializes [object] to Dart built-in type
  @override
  dynamic to(dynamic object) {
    return isJsonFormatEnabled ? object.writeToJson() : object.writeToBuffer();
  }

  /// Deserializes Dart built-in object to Dart PODO
  @override
  dynamic from<T>(dynamic object) {
    final ser = getByType(T);
    if (ser == null) {
      print('warning: no serializer for $T');
      return null;
    }
    return ser(object);
  }

  @override
  List<T> listFrom<T>(List object) {
    return object.map((item) => from<T>(item));
  }

  @override
  Map<String, T> mapFrom<T>(Map<String, dynamic> object) {
    throw 'not needed';
  }

  @override
  T oneFrom<T>(object) {
    return from<T>(object);
  }

  FromProtoBuf getByType(Type type) {
    return isJsonFormatEnabled ? jsonCalls[type] : bufferCalls[type];
  }
}
