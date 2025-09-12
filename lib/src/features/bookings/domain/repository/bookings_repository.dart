import 'package:ayucare/src/core/error/failure.dart';
import 'package:ayucare/src/features/bookings/domain/entity/branch.dart';
import 'package:ayucare/src/features/bookings/domain/entity/patient.dart';
import 'package:ayucare/src/features/bookings/domain/entity/treatment.dart';
import 'package:dartz/dartz.dart';

abstract class BookingsRepository {
  Future<Either<Failure, List<Patient>>> getPatients({required String token});
  Future<Either<Failure, List<Branch>>> getBranches({required String token});
  Future<Either<Failure, List<Treatment>>> getTreatments({
    required String token,
  });
  Future<void> registerPatient({required String token});
}
