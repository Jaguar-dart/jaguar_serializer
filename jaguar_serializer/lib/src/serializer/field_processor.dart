import 'package:date_format/date_format.dart';

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

DateTime _toUtc(DateTime value, bool isUtc) => isUtc ? value?.toUtc() : value;

class DateTimeMillisecondsProcessor implements FieldProcessor<DateTime, int> {
  final bool isUtc;

  const DateTimeMillisecondsProcessor({this.isUtc: false});

  const DateTimeMillisecondsProcessor.utc() : isUtc = true;

  int serialize(DateTime value) =>
      value != null ? _toUtc(value, isUtc).millisecondsSinceEpoch : null;

  @override
  DateTime deserialize(int value) => value != null
      ? new DateTime.fromMillisecondsSinceEpoch(value, isUtc: isUtc)
      : null;
}

class DateTimeProcessor implements FieldProcessor<DateTime, String> {
  final bool isUtc;

  const DateTimeProcessor({this.isUtc: false});

  const DateTimeProcessor.utc() : isUtc = true;

  @override
  String serialize(DateTime value) =>
      value != null ? _toUtc(value, isUtc).toIso8601String() : null;

  @override
  DateTime deserialize(String value) =>
      value != null ? DateTime.parse(value) : null;
}

class DateProcessor implements FieldProcessor<DateTime, String> {
  final bool isUtc;

  const DateProcessor({this.isUtc: false});

  const DateProcessor.utc() : isUtc = true;

  @override
  String serialize(DateTime value) =>
      value != null ? formatDate(value, [yyyy, '-', mm, '-', dd]) : null;

  @override
  DateTime deserialize(String value) =>
      value != null ? DateTime.parse(value) : null;
}

num _stringToNum(String value, bool nullOnError) =>
    value != null ? num.tryParse(value) : null;

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

class SafeNumProcessor implements FieldProcessor<num, dynamic> {
  const SafeNumProcessor();

  @override
  num deserialize(final value) {
    if (value is String) {
      return num.tryParse(value) ?? double.nan;
    } else if (value is num) {
      return value;
    } else if (value != null) {
      return double.nan;
    }
    return null;
  }

  @override
  dynamic serialize(num value) {
    if (value?.isNaN == true || value?.isInfinite == true) {
      return '$value';
    }
    return value;
  }
}

class DurationProcessor implements FieldProcessor<Duration, int> {
  const DurationProcessor();

  @override
  Duration deserialize(int value) {
    if (value == null) return null;
    return new Duration(microseconds: value);
  }

  @override
  int serialize(Duration value) {
    if (value == null) return null;
    return value.inMicroseconds;
  }
}

const dateTimeUtcProcessor = const DateTimeProcessor.utc();
const dateTimeMillisecondsUtcProcessor =
    const DateTimeMillisecondsProcessor.utc();
const dateTimeProcessor = const DateTimeProcessor();
const dateTimeMillisecondsProcessor = const DateTimeMillisecondsProcessor();
const numToStringProcessor = const NumToStringProcessor();
const stringToNumProcessor = const StringToNumProcessor();
const rawDate = const RawData();
const safeNumProcessor = const SafeNumProcessor();
const durationProcessor = const DurationProcessor();
