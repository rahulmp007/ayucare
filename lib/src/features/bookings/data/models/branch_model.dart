import 'package:ayucare/src/features/bookings/domain/entity/branch.dart';

class BranchModel extends Branch {
  BranchModel({
    required super.id,
    required super.name,
    required super.location,
    required super.phone,
    required super.mail,
    required super.address,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      phone: json['phone'] ?? '',
      mail: json['mail'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
