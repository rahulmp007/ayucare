import 'package:ayucare/src/core/error/failure.dart';
import 'package:ayucare/src/features/auth/domain/entity/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  });
}
