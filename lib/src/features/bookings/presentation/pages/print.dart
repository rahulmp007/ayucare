import 'package:ayucare/src/core/services/pdf_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:printing/printing.dart';

class PatientPdfPreviewPage extends StatelessWidget {
  const PatientPdfPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pdfService = Get.find<PdfService>();

    return Scaffold(
      appBar: AppBar(title: const Text("PDF Preview")),
      body: PdfPreview(
        build: (format) => pdfService.generatePatientPdf(
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
        ),
        canChangePageFormat: false, // lock to A4 if you want
        canChangeOrientation: true,
        canDebug: true, // helpful for live debugging
      ),
    );
  }
}
