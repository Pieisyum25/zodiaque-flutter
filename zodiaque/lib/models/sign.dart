class Sign {
  final String name;
  final int startDay;
  final int startMonth;
  final int endDay;
  final int endMonth;

  const Sign(
      this.name, this.startDay, this.startMonth, this.endDay, this.endMonth);

  String periodToString() {
    return "${monthToString(startMonth)} $startDay - ${monthToString(endMonth)} $endDay";
  }

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
