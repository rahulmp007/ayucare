import 'dart:developer';

import 'package:ayucare/src/core/data_state/data_state.dart';
import 'package:ayucare/src/features/bookings/domain/entity/branch.dart';
import 'package:ayucare/src/features/bookings/domain/entity/patient.dart';
import 'package:ayucare/src/features/bookings/domain/entity/treatment.dart';
import 'package:ayucare/src/features/bookings/domain/repository/bookings_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class BookingsController extends GetxController {
  final BookingsRepository repository;
  final FlutterSecureStorage secureStorage;

  BookingsController({required this.repository, required this.secureStorage});

  @override
  void onInit() {
    super.onInit();
    getToken();
  }

  String apiToken = '';

  Future getToken() async {
    apiToken = await secureStorage.read(key: 'token') ?? '';
    log('API TOKEN : $apiToken');
  }

  Rx<Ds<List<Patient>>> patientsState = Rx(Initial());

  Rx<Ds<List<Branch>>> branchesState = Rx(Initial());

  Rx<Ds<List<Treatment>>> treatmentsState = Rx(Initial());

  // 🔹 Actions
  Future<void> fetchPatients() async {
    patientsState.value = Loading();
    final result = await repository.getPatients(token: apiToken);
    result.fold(
      (failure) => patientsState.value = Failed(e: failure.message),
      (data) => patientsState.value = Success(data: data),
    );
  }

  Future<void> fetchBranches() async {
    branchesState.value = Loading();
    final result = await repository.getBranches(token: apiToken);
    result.fold(
      (failure) => branchesState.value = Failed(e: failure.message),
      (data) => branchesState.value = Success(data: data),
    );
  }

  Future<void> fetchTreatments() async {
    treatmentsState.value = Loading();
    final result = await repository.getTreatments(token: apiToken);
    result.fold(
      (failure) => treatmentsState.value = Failed(e: failure.message),
      (data) => treatmentsState.value = Success(data: data),
    );
  }

  Future<void> registerPatient(Map<String, dynamic> body) async {
    patientsState.value = Loading(); // show loading while registering
    try {
      await repository.registerPatient(token: apiToken);
      await fetchPatients(); // refresh after registration
    } catch (e) {
      patientsState.value = Failed(e: e.toString());
    }
  }
}
