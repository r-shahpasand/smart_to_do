class Helper {
  static final Helper _singleton = Helper._internal();

  factory Helper() {
    return _singleton;
  }

  Helper._internal();

  String formatDateTime(DateTime dateTime, {bool includeTime = true}) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    final weekdays = [
      'Sunday', 'Monday', 'Tuesday', 'Wednesday',
      'Thursday', 'Friday', 'Saturday'
    ];

    final month = months[dateTime.month - 1];
    final weekday = weekdays[dateTime.weekday - 1];
    final day = dateTime.day;
    final year = dateTime.year;

    // Format time with AM/PM
    String formatTime(int hour, int minute) {
      final period = hour < 12 ? 'AM' : 'PM';
      final adjustedHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
      return '$adjustedHour:${minute.toString().padLeft(2, '0')} $period';
    }

    final datePart = '$weekday, $month $day, $year';
    final timePart = includeTime ? ' at ${formatTime(dateTime.hour, dateTime.minute)}' : '';

    return datePart + timePart;
  }
}