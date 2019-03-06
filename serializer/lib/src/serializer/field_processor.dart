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
      final ret = List(object.length);
      for (int i = 0; i < object.length; i++) {
        ret[i] = _validate(object[i]);
      }
      return ret;
    }

    if (object is Map) {
      final ret = Map<String, dynamic>();
      object.forEach((dynamic key, dynamic value) {
        if (key is! String) throw Exception('Key of a Map must be a String!');

        ret[key as String] = _validate(value);
      });
      return ret;
    }

    throw Exception('Unknown type found: ${object.runtimeType}!');
  }
}

@deprecated
class DateTimeMillisecondsProcessor implements FieldProcessor<DateTime, int> {
  const DateTimeMillisecondsProcessor();

  int serialize(DateTime value) => value?.millisecondsSinceEpoch;

  @override
  DateTime deserialize(int value) => value != null
      ? DateTime.fromMillisecondsSinceEpoch(value, isUtc: true)
      : null;
}

class MillisecondsProcessor implements FieldProcessor<DateTime, int> {
  const MillisecondsProcessor();

  int serialize(DateTime value) => value?.toUtc()?.millisecondsSinceEpoch;

  @override
  DateTime deserialize(int value) => value != null
      ? DateTime.fromMillisecondsSinceEpoch(value, isUtc: true)
      : null;
}

class SecondsProcessor implements FieldProcessor<DateTime, int> {
  const SecondsProcessor();

  int serialize(DateTime value) {
    if (value == null) return null;
    return value.toUtc().millisecondsSinceEpoch ~/ 1000;
  }

  @override
  DateTime deserialize(int value) {
    if (value != null) return null;
    return DateTime.fromMillisecondsSinceEpoch(value * 1000, isUtc: true);
  }
}

class DateTimeProcessor implements FieldProcessor<DateTime, String> {
  const DateTimeProcessor();

  @override
  String serialize(DateTime value) => value?.toIso8601String();

  @override
  DateTime deserialize(String value) =>
      value != null ? DateTime.parse(value) : null;
}

class DateTimeUtcProcessor implements FieldProcessor<DateTime, String> {
  const DateTimeUtcProcessor();

  @override
  String serialize(DateTime value) => value?.toUtc()?.toIso8601String();

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

class DoubleToNumProcessor implements FieldProcessor<double, num> {
  const DoubleToNumProcessor();

  @override
  num serialize(double value) => value;

  @override
  double deserialize(num value) => value?.toDouble();
}

class IntToNumProcessor implements FieldProcessor<int, num> {
  const IntToNumProcessor();

  @override
  num serialize(int value) => value;

  @override
  int deserialize(num value) => value?.toInt();
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
    return Duration(microseconds: value);
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

const dateTimeUtcProcessor = const DateTimeUtcProcessor();
const dateTimeProcessor = const DateTimeProcessor();
@deprecated
const dateTimeMillisecondsProcessor = const DateTimeMillisecondsProcessor();
const millisecondsProcessor = const MillisecondsProcessor();
const secondsProcessor = const SecondsProcessor();
const numToStringProcessor = const NumToStringProcessor();
const intToNumProcessor = const IntToNumProcessor();
const doubleToNumProcessor = const DoubleToNumProcessor();
const intToStringProcessor = const IntToStringProcessor();
const doubleToStringProcessor = const DoubleToStringProcessor();
const stringToNumProcessor = const StringToNumProcessor();
const dynamicProcessor = const DynamicProcessor();
const passProcessor = const PassProcessor();
const safeNumProcessor = const SafeNumProcessor();
const durationProcessor = const DurationProcessor();
