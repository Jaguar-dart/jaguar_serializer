import 'dart:convert';

import '../serializer/serializer.dart';
import 'package:jaguar_serializer/src/repo/repo.dart';
import "codec.dart";

/// Repository that serialize/deserialize JSON.
///
/// Same usage as [SerializerRepo]
class JsonRepo extends SerializerRepoImpl implements CodecRepo<String> {
  JsonRepo({List<Serializer> serializers}) : super(serializers: serializers);

  ///@nodoc
  /// use [serialize]
  String encode(dynamic object) => json.encode(to(object));

  ///@nodoc
  /// use [deserialize]
  dynamic decode<T>(String object) => from<T>(json.decode(object));

  ///@nodoc
  /// use [deserialize]
  T decodeOne<T>(String object) => oneFrom<T>(json.decode(object));

  ///@nodoc
  /// use [deserialize]
  List<T> decodeList<T>(String object) =>
      listFrom<T>(json.decode(object) as List);
}
