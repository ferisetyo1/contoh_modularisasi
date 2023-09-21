import 'package:intl/intl.dart';

extension DateTimeFormatExt on DateTime? {
  String getddMMyyyy({String separator = ""}) {
    return parseDateToString(this?.toLocal(),
            format: "dd${separator}MM${separator}yyyy") ??
        "";
  }

  String getddMMMyyyy() {
    return parseDateToString(this?.toLocal(), format: "dd MMM yyyy") ?? "";
  }

  String getddMMMMyyyy() {
    return parseDateToString(this?.toLocal(), format: "dd MMMM yyyy") ?? "";
  }

  String getyyyyMMdd({String separator = "-"}) {
    return parseDateToString(this?.toLocal(),
            format: "yyyy${separator}MM${separator}dd") ??
        "";
  }

  String getHHmm({String separator = ":"}) {
    return parseDateToString(this?.toLocal(), format: "HH${separator}mm") ?? "";
  }

  String getEEE() {
    return parseDateToString(this?.toLocal(), format: "EEE") ?? "";
  }

  String getFormatedString(String s) {
    return parseDateToString(this?.toLocal(), format: s) ?? "";
  }
}

DateTime? parseStringToDate(String? date,
    {String format = 'yyyy-MM-dd HH:mm:ss'}) {
  if (date == null || date.isEmpty) return null;
  return DateFormat(format, "id").parseUTC(date);
}

String? parseDateToString(
  DateTime? date, {
  String format = 'yyyy-MM-dd HH:mm:ss',
}) {
  if (date == null) return null;
  return DateFormat(format, "id").format(date);
}

extension DateTimeExt on DateTime {
  DateTime getFirstDayOfMonth() => DateTime(year, month, 1);
  DateTime getLastDayOfMonth() => DateTime(year, month + 1, 0);
}
