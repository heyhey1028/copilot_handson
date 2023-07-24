/// 和暦文字列をDateTimeに変換する
DateTime sampleJapaneseCalendarToGregorian(String japaneseCalendar) {
  Map<String, int> eraStarts = {
    '明治': 1868,
    '大正': 1912,
    '昭和': 1926,
    '平成': 1989,
    '令和': 2019,
  };

  // era ends
  Map<String, int> eraLastsFor = {
    '明治': 45,
    '大正': 15,
    '昭和': 64,
    '平成': 31,
    '令和': 99,
  };

  // The RegExp pattern here matches any of the specified characters
  RegExp pattern = RegExp(r'年|月|日');
  // split the string based on the pattern
  List<String> parts = japaneseCalendar.split(pattern);

  parts.removeLast();

  if (parts.length != 3) {
    throw FormatException('Expected 3 parts, got ${parts.length}');
  }

  // prepare the eraYear string
  String eraYear = '${parts[0]}年';
  eraYear = eraYear.replaceAll('元年', '1年');
  // converting eraYear to Western Year
  RegExp patternEra = RegExp(r'(\D+)(\d+)年');
  RegExpMatch? match = patternEra.firstMatch(eraYear);

  if (match == null) {
    throw const FormatException('Invalid format');
  }

  String era = match.group(1)!;
  String year = match.group(2)!;

  int? yearInEra = int.tryParse(year);
  if (yearInEra == null) {
    throw const FormatException('Year is in Invalid format');
  }

  int? eraStart = eraStarts[era];

  if (eraStart == null) {
    throw const FormatException('Unknown era');
  }

  if (yearInEra < 1 || eraLastsFor[era]! < yearInEra) {
    throw const FormatException('Year is not in range');
  }

  int westernYear = eraStart + yearInEra - 1;
  int? month = int.tryParse(parts[1]);
  if (month == null) {
    throw const FormatException('Month is in Invalid format');
  }
  if (month < 1 || 12 < month) {
    throw const FormatException('Month is not in range');
  }

  int? day = int.tryParse(parts[2]);
  if (day == null) {
    throw const FormatException('Day is in Invalid format');
  }
  if (day < 1 || 31 < day) {
    throw const FormatException('Day is not in range');
  }

  DateTime dateTime = DateTime(westernYear, month, day);
  if (dateTime.isBefore(DateTime(1868, 9, 8))) {
    throw const FormatException('Date is before the Japanese calendar');
  }
  return dateTime;
}
