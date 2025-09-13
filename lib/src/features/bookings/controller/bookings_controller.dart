import 'dart:developer';

import 'package:ayucare/src/core/data_state/data_state.dart';
import 'package:ayucare/src/core/services/pdf_service.dart';
import 'package:ayucare/src/features/bookings/domain/entity/branch.dart';
import 'package:ayucare/src/features/bookings/domain/entity/patient.dart';
import 'package:ayucare/src/features/bookings/domain/entity/treatment.dart';
import 'package:ayucare/src/features/bookings/domain/repository/bookings_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

class BookingsController extends GetxController {
  final BookingsRepository repository;
  final FlutterSecureStorage secureStorage;
  final PdfService pdfService;

  BookingsController({
    required this.repository,
    required this.secureStorage,
    required this.pdfService,
  });

  @override
  void onInit() {
    super.onInit();
    init();
  }

  String apiToken = '';

  Future getToken() async {
    apiToken = await secureStorage.read(key: 'token') ?? '';
    log('API TOKEN : $apiToken');
  }

  Future<void> init() async {
    await getToken();
    await fetchPatients();
  }

  Rx<Ds<List<Patient>>> patientsState = Rx(Initial());

  Rx<Ds<List<Branch>>> branchesState = Rx(Initial());

  Rx<Ds<List<Treatment>>> treatmentsState = Rx(Initial());

  RxList<Branch> branchList = RxList([]);

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
      (failure) {
        branchList.value = [];
        return branchesState.value = Failed(e: failure.message);
      },
      (data) {
        branchList.value = data;
        return branchesState.value = Success(data: data);
      },
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

  // book slot
  //

  final nameCtrl = TextEditingController();
  final whatsappCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final totalAmountCtrl = TextEditingController();
  final discountAmountCtrl = TextEditingController();
  final advanceAmountCtrl = TextEditingController();
  final balanceAmountCtrl = TextEditingController();

  final location = RxnString();
  final branch = RxnString();
  final treatments = <String>[].obs;

  final paymentOption = 0.obs;

  final treatmentDate = Rxn<DateTime>();
  final treatmentHour = RxnString();
  final treatmentMinute = RxnString();

  void setLocation(String? value) {
    location.value = value;
    log("Selected Location: $value");
  }

  void setBranch(String? value) {
    branch.value = value;
    log("Selected Branch: $value");
  }

  void addTreatment(String treatment) {
    treatments.add(treatment);
    log("Added Treatment: $treatment");
  }

  void setPaymentOption(int value) {
    paymentOption.value = value;
    log("Payment Option: $value");
  }

  void setTreatmentDate(DateTime? date) {
    treatmentDate.value = date;
    log("Treatment Date: $date");
  }

  void setHour(String? hr) {
    treatmentHour.value = hr;
    log("Hour: $hr");
  }

  void setMinute(String? min) {
    treatmentMinute.value = min;
    log("Minute: $min");
  }

  RxBool addTreatments = RxBool(false);

  void setAddTreatments() {
    addTreatments.value = !addTreatments.value;
  }

  Future<void> registerPatient() async {
    patientsState.value = Loading();
    try {
      await Future.delayed(Duration(seconds: 2));
      final pdfBytes = pdfService.generatePatientPdf(
        patientName: "Salih T",
        phone: "+91 9876543210",
        address: "Nadakkave, Kozhikkode",
        bookedOn: "31/01/2024  12:12pm",
        treatmentDate: "21/02/2024",
        treatmentTime: "11:00 am",
        treatments: [
          {
            "name": "Panchakarma",
            "price": 230,
            "male": 4,
            "female": 4,
            "total": 2540,
          },
          {
            "name": "Njavara Kizhi Treatment",
            "price": 230,
            "male": 4,
            "female": 4,
            "total": 2540,
          },
          {
            "name": "Panchakarma",
            "price": 230,
            "male": 4,
            "female": 6,
            "total": 2540,
          },
        ],
        totalAmount: 7620,
        discount: 500,
        advance: 1200,
        balance: 5920,
      );

      await Printing.layoutPdf(onLayout: (format) async => pdfBytes);

      // await repository.registerPatient(
      //   token: apiToken,
      //   data: {
      //     "name": 'rahul',
      //     "excecutive": "jhon",
      //     "payment": 'upi',
      //     "phone": '9075356534',
      //     "address": 'XYZ Street',
      //     "total_amount": 100.0,
      //     "discount_amount": 10.0,
      //     "advance_amount": 50.0,
      //     "balance_amount": 30.0,
      //     "date_nd_time": "01/02/2024-10:24 AM",
      //     "id": '1',
      //     "male": ["2", "3"],
      //     "female": ["1", "4"],
      //     "branch": 'abcd',
      //     "treatments": ["2", "4"],
      //     // "name": nameCtrl.text.trim(),
      //     // "executive": "jhon",
      //     // "payment": paymentOption.value == 1
      //     //     ? 'cash'
      //     //     : paymentOption.value == 2
      //     //     ? 'card'
      //     //     : 'upi',
      //     // "phone": whatsappCtrl.text.trim(),
      //     // "address": addressCtrl.text,
      //     // "total_amount": totalAmountCtrl.text,
      //     // "discount_amount": discountAmountCtrl.text,
      //     // "advance_amount": advanceAmountCtrl.text,
      //     // "balance_amount": balanceAmountCtrl.text,
      //     // "date_nd_time": "01/02/2024-10:24 AM",
      //     // "id": "",
      //     // "male": ["2", "3"],
      //     // "female": ["1", "4"],
      //     // "branch": branch.value,
      //     // "treatments": ["2", "4"],
      //   },
      // );
    } catch (e) {
      patientsState.value = Failed(e: e.toString());
    }
  }
}
