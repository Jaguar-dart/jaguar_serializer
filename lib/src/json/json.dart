library jaguar_serializer.json;

import 'dart:convert';
import 'package:jaguar_serializer/serializer.dart';

/**
 * Repository that serialize/deserialize JSON.
 *
 * Same usage as [SerializerRepo]
 */
class JsonRepo extends SerializerRepo {
  JsonRepo({String typeInfoKey: defaultTypeInfoKey}) : super(typeInfoKey: typeInfoKey);

  ///@nodoc
  dynamic encode(dynamic object) => JSON.encode(object);

  ///@nodoc
  dynamic decode(dynamic object) => JSON.decode(object);

  /**
   * Deserialize a JSON String to an object.
   *
   * [object] can be a JSON String, a [List] of JSON String.
   *
   * See [SerializerRepo.from] for more information.
   */
  @override
  dynamic from(dynamic object, {Type type, String useTypeInfoKey}) =>
      super.from(object, type: type, useTypeInfoKey: useTypeInfoKey);

  /**
   * Serialize an object to a JSON String
   *
   * [object] can be a [List], [Map] or a serializable object.
   *
   * See [SerializerRepo.to] for more information.
   */
  @override
  dynamic to(dynamic object, {bool withTypeInfo: false, String useTypeInfoKey}) =>
      super.to(object, withTypeInfo: withTypeInfo, useTypeInfoKey: useTypeInfoKey);
}
