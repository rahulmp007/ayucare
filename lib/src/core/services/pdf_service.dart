import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  Future<Uint8List> generatePatientPdf({
    required String patientName,
    required String phone,
    required String address,
    required String bookedOn,
    required String treatmentDate,
    required String treatmentTime,
    required List<Map<String, dynamic>> treatments,
    required double totalAmount,
    required double discount,
    required double advance,
    required double balance,
  }) async {
    final pdf = pw.Document();

    // Load logo from assets
    final logoBytes = await rootBundle.load('assets/images/logo.png');
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

    final fontData = await rootBundle.load('assets/fonts/NotoSans.ttf');
    log('font : $fontData');
    final notoFont = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Positioned.fill(
                child: pw.Opacity(
                  opacity: 0.1,
                  child: pw.Center(
                    child: pw.Image(logoImage, fit: pw.BoxFit.contain),
                  ),
                ),
              ),

              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        height: 80,
                        width: 80,
                        decoration: const pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                        ),
                        child: pw.Center(
                          child: pw.Image(logoImage, fit: pw.BoxFit.contain),
                        ),
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.end,
                        children: [
                          pw.Text(
                            "KUMARAKOM",
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          pw.Text("Cheepunkal P.O. Kottayam, Kerala - 686563"),
                          pw.Text("Email: unknown@gmail.com"),
                          pw.Text("Mob: +91 9876543210 | +91 9786543210"),
                          pw.Text("GST No: 32ABCDE0939Z1W"),
                        ],
                      ),
                    ],
                  ),

                  pw.Divider(),

                  // Patient Details
                  pw.Text(
                    "Patient Details",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.green,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Name: $patientName"),
                          pw.Text("Address: $address"),
                          pw.Text("WhatsApp: $phone"),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Booked On: $bookedOn"),
                          pw.Text("Treatment Date: $treatmentDate"),
                          pw.Text("Treatment Time: $treatmentTime"),
                        ],
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 15),

                  pw.Table.fromTextArray(
                    headers: ["Treatment", "Price", "Male", "Female", "Total"],
                    headerStyle: pw.TextStyle(
                      font: notoFont, // ✅ Use NotoSans font here
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.green,
                    ),
                    headerDecoration: const pw.BoxDecoration(
                      border: pw.Border(bottom: pw.BorderSide()),
                    ),
                    cellStyle: pw.TextStyle(
                      font: notoFont, // ✅ Use NotoSans for table cells too
                      fontSize: 12,
                    ),
                    cellAlignment: pw.Alignment.centerLeft,
                    data: treatments.map((t) {
                      return [
                        t["name"],
                        "₹${t["price"]}",
                        t["male"].toString(),
                        t["female"].toString(),
                        "₹${t["total"]}",
                      ];
                    }).toList(),
                  ),

                  pw.SizedBox(height: 20),

                  // Totals
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "Total Amount: ₹$totalAmount",
                            style: pw.TextStyle(
                              font: notoFont,
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "Discount: ₹$discount",
                            style: pw.TextStyle(
                              font: notoFont,
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "Advance: ₹$advance",
                            style: pw.TextStyle(
                              font: notoFont,
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(
                            "Balance: ₹$balance",
                            style: pw.TextStyle(
                              font: notoFont,
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  pw.SizedBox(height: 30),

                  // Footer
                  pw.Center(
                    child: pw.Column(
                      children: [
                        pw.Text(
                          "Thank you for choosing us",
                          style: pw.TextStyle(
                            color: PdfColors.green,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        pw.Text(
                          "Your well-being is our commitment, and we are honored you have entrusted us with your health journey",
                          textAlign: pw.TextAlign.center,
                          style: const pw.TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
