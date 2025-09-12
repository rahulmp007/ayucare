import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  /// Formats date as 'dd MMM yyyy', e.g. 17 Aug 2025
  String toReadableDate() => DateFormat('dd MMM yyyy').format(this);

  /// Optional: Add other common formats if needed
  String toShortDate() => DateFormat('dd/MM/yyyy').format(this);
  String toFullDate() => DateFormat('EEEE, dd MMMM yyyy').format(this);
}
