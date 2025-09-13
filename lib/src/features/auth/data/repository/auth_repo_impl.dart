
import 'dart:developer';

import 'package:ayucare/src/core/url.dart';
import 'package:dartz/dartz.dart';

import 'package:ayucare/src/core/error/failure.dart';
import 'package:ayucare/src/core/network/api_client.dart';
import 'package:ayucare/src/features/auth/data/model/user_model.dart';
import 'package:ayucare/src/features/auth/domain/entity/user.dart';
import 'package:ayucare/src/features/auth/domain/repository/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;
  AuthRepositoryImpl({required this.apiClient});

  @override
  Future<Either<Failure, User>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await apiClient.post(
        url: '${Url.baseUrl}/${Url.login}',

        data: {"username": username, "password": password},
        asForm: true,
      );

      if (username == response['user_details']['name'] &&
          password == response['user_details']['password_text']) {
        final user = UserModel.fromJson(response).toEntity();
        log(user.toString());
        return Right(user);
      } else {
        return Left(Failure(message: 'Invalid username or password'));
      }
    } catch (e) {
      return Left(Failure(message: 'Something went wrong: $e'));
    }
  }
}
