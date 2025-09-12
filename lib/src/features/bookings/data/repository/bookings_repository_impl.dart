import 'package:ayucare/src/core/error/failure.dart';
import 'package:ayucare/src/core/url.dart';
import 'package:ayucare/src/features/bookings/data/models/branch_model.dart';
import 'package:ayucare/src/features/bookings/data/models/patient_model.dart';
import 'package:ayucare/src/features/bookings/data/models/treatment_model.dart';
import 'package:ayucare/src/features/bookings/domain/entity/branch.dart';
import 'package:ayucare/src/features/bookings/domain/entity/patient.dart';
import 'package:ayucare/src/features/bookings/domain/entity/treatment.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:ayucare/src/core/network/api_client.dart';
import 'package:ayucare/src/features/bookings/domain/repository/bookings_repository.dart';

class BookingsRepositoryImpl implements BookingsRepository {
  final ApiClient client;
  BookingsRepositoryImpl({required this.client});

  @override
  Future<Either<Failure, List<Patient>>> getPatients({
    required String token,
  }) async {
    try {
      final response = await client.get(
        url: "${Url.baseUrl}/${Url.patientList}",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response['status'] == true) {
        if (response['status'] == true && response['patient'] != null) {
          final patients = (response['patient'] as List<dynamic>)
              .map((e) => PatientModel.fromJson(e))
              .toList();
          return Right(patients);
        } else {
          return Right([]);
        }
      } else {
        return Left(Failure(message: "Failed to fetch patients"));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Branch>>> getBranches({
    required String token,
  }) async {
    try {
      final response = await client.get(
        url: "${Url.baseUrl}${Url.branches}",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response['status'] == true) {
        final branches = (response as List<dynamic>)
            .map((e) => BranchModel.fromJson(e))
            .toList();
        return Right(branches);
      } else {
        return Left(Failure(message: "Failed to fetch branches"));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Treatment>>> getTreatments({
    required String token,
  }) async {
    try {
      final response = await client.get(
        url: "${Url.baseUrl}${Url.treatments}",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response['status'] == true) {
        final treatments = (response as List<dynamic>)
            .map((e) => TreatmentModel.fromJson(e))
            .toList();
        return Right(treatments);
      } else {
        return Left(Failure(message: "Failed to fetch treatments"));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> registerPatient({required String token}) async {
    // Keeping void return as per your definition
    await http.post(
      Uri.parse("${Url.baseUrl}${Url.patientUpdate}"),
      headers: {"Authorization": "Bearer $token"},
      body: {},
    );
  }
}
