import 'package:flutter_datetime_picker_bdaya/flutter_datetime_picker_bdaya.dart';

class CustomDateTimePickerModel extends DateTimePickerModel {
  CustomDateTimePickerModel(
      {required DateTime currentTime,
      required DateTime minTime,
      required DateTime maxTime,
      required LocaleType locale})
      : super(
            locale: locale,
            minTime: minTime,
            maxTime: maxTime,
            currentTime: currentTime) {
    if (currentTime.minute <= 30) {
      setRightIndex(1);
    } else {
      setRightIndex(0);
      if (isAtSameDay(currentTime, currentTime.add(const Duration(hours: 1)))) {
        setMiddleIndex(currentTime.hour + 1);
      } else {
        setLeftIndex(currentLeftIndex() + 1);
        setMiddleIndex(0);
      }
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index == 0) {
      return '0';
    } else if (index == 1) {
      return '30';
    }
    return null;
  }

  @override
  DateTime finalTime() {
    DateTime time = currentTime.add(Duration(days: currentLeftIndex()));
    var hour = currentMiddleIndex();
    var minute = currentRightIndex() * 30;

    return currentTime.isUtc
        ? DateTime.utc(time.year, time.month, time.day, hour, minute)
        : DateTime(time.year, time.month, time.day, hour, minute);
  }
}

bool isAtSameDay(DateTime? day1, DateTime? day2) {
  return day1 != null &&
      day2 != null &&
      day1.difference(day2).inDays == 0 &&
      day1.day == day2.day;
}
