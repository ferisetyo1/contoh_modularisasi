import "package:flutter/material.dart";
import "package:intl/intl.dart";

extension StringExt on String? {
  String toIDRFormat() {
    return NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0)
        .format(int.tryParse(this ?? "0") ?? 0);
  }

  String toRupiahFormat() {
    return NumberFormat.currency(locale: "id", symbol: "Rp ", decimalDigits: 0)
        .format(int.tryParse(this ?? "0") ?? 0);
  }

  String toCapitalized({String? emptyCase}) => this?.isNotEmpty == true
      ? '${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}'
      : emptyCase ?? '';
  String toTitleCase({String? emptyCase}) =>
      this
          ?.replaceAll(RegExp(' +'), ' ')
          .split(' ')
          .map((str) => str.toCapitalized())
          .join(' ') ??
      emptyCase ??
      "";
  String safe({String safe = ""}) => this ?? safe;

  DateTime? toDate() => DateTime.tryParse(this ?? "");
  TimeOfDay? toTimeOfDay() {
    try {
      final date = DateFormat("HH:mm").parse(this ?? "");
      return TimeOfDay.fromDateTime(date);
    } catch (e) {
      return null;
    }
  }

  Color toColor() {
    // if (this == null) {
    //   return const Color(0xFF000000);
    // }
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString?.length == 6 || hexString?.length == 7) buffer.write('ff');
    buffer.write(hexString?.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
