library jaguar_serializer.serializer.field_processor;

/// Interface specification to add custom field decoders
/// Can be used to basic value like [DateTime] or [ObjectId] to [String]
///
/// Example:
///
///     @DefineFieldProcessor()
///     class DateTimeProcessor implements FieldProcessor<DateTime, String> {
///
///       const DateTimeProcessor();
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
///     @GenSerializer(
///       processors: const {
///         'dates': const MongoId(),
///       },
///     )
///     class UserSerializer extends Serializer<User> with _$UserSerializer {}
///
///     class User {
///        DateTime birthday;
///     }
abstract class FieldProcessor<FromType, ToType> {
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
///     @GenSerializer(
///       processors: const {
///         'data': const RawData(),
///         'list': const RawData(),
///       },
///     )
///     class ModelSerializer extends Serializer<Model> with _$ModelSerializer {}
///
///     class Model {
///        Map<String, dynamic> data;
///        List<dynamic> list;
///     }
class RawData implements FieldProcessor<dynamic, dynamic> {
  const RawData();

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

  void _validate(dynamic object) {
    if (object == null) return;

    if (object is num) return;

    if (object is String) return;

    if (object is List) {
      object.forEach(_validate);
      return;
    }

    if (object is Map) {
      object.forEach((dynamic key, dynamic value) {
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

class DateTimeProcessor implements FieldProcessor<DateTime, dynamic> {
  final bool inMilliseconds;
  final bool isUtc;

  const DateTimeProcessor({this.inMilliseconds: false, this.isUtc: false});

  const DateTimeProcessor.utc()
      : isUtc = true,
        inMilliseconds = false;

  const DateTimeProcessor.utcMilliseconds()
      : isUtc = true,
        inMilliseconds = true;

  const DateTimeProcessor.milliseconds()
      : isUtc = false,
        inMilliseconds = true;

  DateTime _toUtc(DateTime value) => isUtc ? value.toUtc() : value;

  @override
  dynamic serialize(DateTime value) => value != null
      ? (inMilliseconds
          ? _toUtc(value).millisecondsSinceEpoch
          : _toUtc(value).toIso8601String())
      : null;

  @override
  DateTime deserialize(dynamic value) => value != null
      ? (inMilliseconds
          ? new DateTime.fromMillisecondsSinceEpoch(value as int, isUtc: isUtc)
          : DateTime.parse(value as String))
      : null;
}

num _stringToNum(String value, bool nullOnError) =>
    num.parse(value, nullOnError ? (_) => null : null);

class StringToNumProcessor implements FieldProcessor<String, num> {
  final bool nullOnError;

  const StringToNumProcessor({this.nullOnError: true});

  @override
  num serialize(String value) => _stringToNum(value, nullOnError);

  @override
  String deserialize(num value) => value?.toString();
}

class NumToStringProcessor implements FieldProcessor<num, String> {
  final bool nullOnError;

  const NumToStringProcessor({this.nullOnError: true});

  @override
  String serialize(num value) => value?.toString();

  @override
  num deserialize(String value) => _stringToNum(value, nullOnError);
}

const dateTimeUtcProcessor = const DateTimeProcessor.utc();
const dateTimeMillisecondsUtcProcessor =
    const DateTimeProcessor.utcMilliseconds();
const dateTimeProcessor = const DateTimeProcessor();
const dateTimeMillisecondsProcessor = const DateTimeProcessor.milliseconds();
const numToStringProcessor = const NumToStringProcessor();
const stringToNumProcessor = const StringToNumProcessor();
const rawDate = const RawData();
