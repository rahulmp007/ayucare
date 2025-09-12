import 'package:ayucare/src/features/bookings/domain/entity/treatment.dart';

class TreatmentModel extends Treatment {
  TreatmentModel({
    required super.id,
    required super.treatmentId,
    required super.treatmentName,
    required super.male,
    required super.female,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) {
    return TreatmentModel(
      id: json['id'],
      treatmentId: json['treatment'],
      treatmentName: json['treatment_name'] ?? '',
      male: json['male'] ?? '',
      female: json['female'] ?? '',
    );
  }
}
