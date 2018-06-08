import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'datetime.jser.dart';

class Date {
  String place;
  DateTime date;

  Date({this.date, this.place});
}

@GenSerializer(
  fields: const {
    'date': const Field<DateTime>(processor: const DateTimeProcessor()),
  },
)
class DateSerializer extends Serializer<Date> with _$DateSerializer {}
