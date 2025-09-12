import 'package:ayucare/src/features/bookings/domain/entity/branch.dart';
import 'package:ayucare/src/features/bookings/domain/entity/treatment.dart';

class Patient {
  final int id;
  final String name;
  final String phone;
  final String address;
  final String payment;
  final double totalAmount;
  final double discountAmount;
  final double advanceAmount;
  final double balanceAmount;
  final DateTime dateTime;
  final Branch branch;
  final List<Treatment> treatments;

  Patient({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.payment,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateTime,
    required this.branch,
    required this.treatments,
  });
}
