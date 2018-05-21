import 'dart:convert';

import '../serializer/serializer.dart';
import '../serializer/repo.dart';

/// Repository that serialize/deserialize using provided Codec.
///
/// Same usage as [SerializerRepo]
class CodecRepo extends SerializerRepo {
  final Codec codec;

  CodecRepo(this.codec,
      {List<Serializer> serializers,
      String typeKey: defaultTypeInfoKey,
      bool withType})
      : super(serializers: serializers, typeKey: typeKey, withType: withType);

  ///@nodoc
  /// use [serialize]
  dynamic encode(dynamic object) => codec.encode(object);

  ///@nodoc
  /// use [deserialize]
  dynamic decode(dynamic object) => codec.decode(object as String);
}
