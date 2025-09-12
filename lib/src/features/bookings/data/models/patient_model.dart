import 'package:ayucare/src/features/bookings/data/models/branch_model.dart';
import 'package:ayucare/src/features/bookings/data/models/treatment_model.dart';
import 'package:ayucare/src/features/bookings/domain/entity/patient.dart';

class PatientModel extends Patient {
  PatientModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.address,
    required super.payment,
    required super.totalAmount,
    required super.discountAmount,
    required super.advanceAmount,
    required super.balanceAmount,
    required super.dateTime,
    required super.branch,
    required super.treatments,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      payment: json['payment'] ?? '',
      totalAmount: (json['total_amount'] ?? 0).toDouble(),
      discountAmount: (json['discount_amount'] ?? 0).toDouble(),
      advanceAmount: (json['advance_amount'] ?? 0).toDouble(),
      balanceAmount: (json['balance_amount'] ?? 0).toDouble(),
      dateTime: DateTime.tryParse(json['date_nd_time'] ?? '') ?? DateTime.now(),
      branch: BranchModel.fromJson(json['branch']),
      treatments: (json['patientdetails_set'] as List<dynamic>)
          .map((e) => TreatmentModel.fromJson(e))
          .toList(),
    );
  }
}
