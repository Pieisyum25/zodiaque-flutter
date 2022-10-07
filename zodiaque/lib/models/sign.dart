/// Sign represents a zodiac sign (star sign) like Aries, Taurus, etc.
class Sign {
  /// Sign's name.
  final String name;

  /// The first day of the first month of the Sign.
  final int startDay;

  /// The first month of the Sign.
  final int startMonth;

  /// The last day of the last month of the Sign.
  final int endDay;

  /// The last month of the Sign.
  final int endMonth;

  const Sign(
      this.name, this.startDay, this.startMonth, this.endDay, this.endMonth);

  /// Returns the date period of this Sign in String form.
  String periodToString() {
    return "${monthToString(startMonth)} $startDay - ${monthToString(endMonth)} $endDay";
  }

  /// Converts a month integer to its name in String form.
  static String monthToString(int month) {
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    return months[month - 1];
  }
}
