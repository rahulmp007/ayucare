import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// A service to generate PDF documents.
/// Can be called with any data (mock Patient data for now).
class PdfService {
  final pw.Document pdf = pw.Document();

  /// Generates a PDF with patient details
  /// Returns PDF as Uint8List
  Future<Uint8List> generatePatientPdf({
    required String patientName,
    required String phone,
    required String address,
    required String branch,
    required List<String> treatments,
    required double totalAmount,
    required double discount,
    required double advance,
    required double balance,
    required String dateTime,
  }) async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'Patient Details',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 20),
                pw.Text('Name: $patientName'),
                pw.Text('Phone: $phone'),
                pw.Text('Address: $address'),
                pw.Text('Branch: $branch'),
                pw.SizedBox(height: 10),
                pw.Text(
                  'Treatments:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: treatments.map((t) => pw.Text('- $t')).toList(),
                ),
                pw.SizedBox(height: 10),
                pw.Text('Total Amount: ₹$totalAmount'),
                pw.Text('Discount: ₹$discount'),
                pw.Text('Advance: ₹$advance'),
                pw.Text('Balance: ₹$balance'),
                pw.SizedBox(height: 20),
                pw.Text('Date & Time: $dateTime'),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  /// Clear the PDF document for generating a new one
  void clearPdf() {}
}
