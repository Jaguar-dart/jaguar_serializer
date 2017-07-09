part of jaguar_serializer.serializer;

/// Interface specification to add custom field decoders
/// Can be used to basic value like [DateTime] or [ObjectId] to [String]
///
/// Example:
///
///     @DefineFieldProcessor()
///     class DateTimeProcessor implements FieldProcessor<DateTime, String> {
///       final Symbol field;
///
///       const DateTimeProcessor(this.field);
///
///       DateTime deserialize(String input) {
///         return DateTime.parse(input);
///       }
///
///       String serialize(DateTime value) {
///        return value.toIso8601String();
///       }
///     }
///
///
///     @GenSerializer()
///     @MongoId(#id)
///     class UserSerializer extends Serializer<User> with _$UserSerializer {
///        User createModel() => new User();
///     }
///
///     class User {
///        DateTime birthday;
///     }
abstract class FieldProcessor<FromType, ToType> {
  /// Field in the model to be processed
  Symbol get field;

  /// fixme? (lejard_h) do we really need to store the symbole here ?

  /// Called to process field before decoding
  FromType deserialize(ToType value);

  /// Called to process field before encoding
  ToType serialize(FromType value);
}

/// RawData Field Processor
///
/// Useful when no need to decode a List<dynamic> or a Map<String, dynamic>
///
/// Example:
///
///     @GenSerializer()
///     @RawData(#data)
///     class ModelSerializer extends Serializer<Model> with _$ModelSerializer {
///        User createModel() => new Model();
///     }
///
///     class Model {
///        Map<String, dynamic> data;
///     }
@DefineFieldProcessor()
class RawData implements FieldProcessor {
  final Symbol field;

  const RawData(this.field);

  @override
  dynamic serialize(dynamic value) {
    _validate(value);
    return value;
  }

  @override
  dynamic deserialize(dynamic value) {
    _validate(value);
    return value;
  }

  void _validate(object) {
    if (object == null) return;

    if (object is num) return;

    if (object is String) return;

    if (object is List) {
      object.forEach(_validate);
      return;
    }

    if (object is Map) {
      object.forEach((key, value) {
        if (key is! String) {
          throw new Exception('Key of a RawData Map must be a String!');
        }

        _validate(value);
      });
      return;
    }

    throw new Exception(
        'Unknown RawData type found ${object.runtimeType}! Only List, Map, String and num are accepted!');
  }
}
