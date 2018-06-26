import 'package:date_format/date_format.dart';

/// Interface specification to add custom field decoders
/// Can be used to basic value like [DateTime] or [ObjectId] to [String]
///
/// Example:
///
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
/// Useful when no need to decode a dynamic, List<dynamic> or a Map<String, dynamic>
///
/// Example:
///
///     @GenSerializer(
///       processors: const {
///         'data': const DynamicProcessor(),
///         'list': const DynamicProcessor(),
///       },
///     )
///     class ModelSerializer extends Serializer<Model> with _$ModelSerializer {}
///
///     class Model {
///        Map<String, dynamic> data;
///        List<dynamic> list;
///     }
class DynamicProcessor implements FieldProcessor<dynamic, dynamic> {
  const DynamicProcessor();

  @override
  dynamic serialize(dynamic value) => _validate(value);

  @override
  dynamic deserialize(dynamic value) => _validate(value);

  dynamic _validate(dynamic object) {
    if (object == null) return null;

    if (object is num || object is String || object is bool) return object;

    if (object is List) {
      final ret = new List(object.length);
      for (int i = 0; i < object.length; i++) {
        ret[i] = _validate(object[i]);
      }
      return ret;
    }

    if (object is Map) {
      final ret = new Map<String, dynamic>();
      object.forEach((dynamic key, dynamic value) {
        if (key is! String)
          throw new Exception('Key of a Map must be a String!');

        ret[key as String] = _validate(value);
      });
      return ret;
    }

    throw new Exception('Unknown type found: ${object.runtimeType}!');
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

num _stringToNum(String value, bool ignoreErrors) => value != null
    ? (ignoreErrors ? num.tryParse(value) : num.parse(value))
    : null;

class StringToNumProcessor implements FieldProcessor<String, num> {
  final bool ignoreErrors;

  const StringToNumProcessor({this.ignoreErrors: true});

  @override
  num serialize(String value) => _stringToNum(value, ignoreErrors);

  @override
  String deserialize(num value) => value?.toString();
}

class NumToStringProcessor implements FieldProcessor<num, String> {
  final bool ignoreErrors;

  const NumToStringProcessor({this.ignoreErrors: true});

  @override
  String serialize(num value) => value?.toString();

  @override
  num deserialize(String value) => _stringToNum(value, ignoreErrors);
}

class IntToStringProcessor implements FieldProcessor<int, String> {
  final bool ignoreErrors;

  const IntToStringProcessor({this.ignoreErrors: true});

  @override
  String serialize(int value) => value?.toString();

  @override
  int deserialize(String value) => value != null
      ? (ignoreErrors ? int.tryParse(value) : int.parse(value))
      : null;
}

class DoubleToStringProcessor implements FieldProcessor<double, String> {
  final bool ignoreErrors;

  const DoubleToStringProcessor({this.ignoreErrors: true});

  @override
  String serialize(double value) => value?.toString();

  @override
  double deserialize(String value) => value != null
      ? (ignoreErrors ? double.tryParse(value) : double.parse(value))
      : null;
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

/// Passes values as they are
class PassProcessor implements FieldProcessor<dynamic, dynamic> {
  const PassProcessor();

  @override
  dynamic serialize(dynamic value) => value;

  @override
  dynamic deserialize(dynamic value) => value;
}

const dateTimeUtcProcessor = const DateTimeProcessor.utc();
const dateTimeMillisecondsUtcProcessor =
    const DateTimeMillisecondsProcessor.utc();
const dateTimeProcessor = const DateTimeProcessor();
const dateTimeMillisecondsProcessor = const DateTimeMillisecondsProcessor();
const numToStringProcessor = const NumToStringProcessor();
const intToStringProcessor = const IntToStringProcessor();
const doubleToStringProcessor = const DoubleToStringProcessor();
const stringToNumProcessor = const StringToNumProcessor();
const dynamicProcessor = const DynamicProcessor();
const safeNumProcessor = const SafeNumProcessor();
const durationProcessor = const DurationProcessor();
