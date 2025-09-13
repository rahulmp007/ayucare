import 'dart:developer';

import 'package:ayucare/src/features/auth/presentation/widgets/button.dart';
import 'package:ayucare/src/features/bookings/controller/bookings_controller.dart';
import 'package:ayucare/src/features/bookings/presentation/pages/print.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/add_treatment.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/custom_dropdown.dart';
import 'package:ayucare/src/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/date_picker.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/hours.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/minutes.dart';
import 'package:ayucare/src/features/bookings/presentation/widgets/payment_opt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookSlot extends StatelessWidget {
  const BookSlot({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<BookingsController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 64, bottom: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0x33000000)),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SizedBox(
                            height: 28,
                            width: 28,
                            child: Image.asset("assets/icons/back.png"),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset("assets/icons/noti.png"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 34),
                    child: Row(
                      children: [
                        Text(
                          "Register",
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            //body of form
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: ctr.nameCtrl,
                    hintText: 'Enter your full name',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your Whatsapp number",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: ctr.whatsappCtrl,
                    hintText: 'Enter your Whatsapp number',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: ctr.addressCtrl,
                    hintText: 'Enter your full address',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomDropdown(
                    hintText: 'Choose your location',
                    items: ["Arpookara", "villoonni", "kottayam", "Eranakulam"],
                    selectedValue: ctr.location.value,
                    onChanged: (String? value) {
                      ctr.setLocation(value);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Branch",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Obx(
                    () => CustomDropdown(
                      hintText: 'Select the branch',
                      items: [
                        "Arpookara",
                        "villoonni",
                        "kottayam",
                        "Eranakulam",
                      ],
                      selectedValue: ctr.branch.value,
                      onChanged: (String? value) {
                        ctr.setBranch(value);
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Treatments",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Obx(() {
                    return ctr.addTreatments.value == true
                        ? AddTreatment()
                        : SizedBox.shrink();
                  }),

                  Button(
                    title: '+ Add Treatments',
                    onTap: () {
                      ctr.setAddTreatments();
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: ctr.totalAmountCtrl,
                    hintText: '',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discount Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: ctr.discountAmountCtrl,
                    hintText: '',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Option",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  PaymentOpt(
                    onOptionSelected: (int value) {
                      log("value:$value");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Advance Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: ctr.advanceAmountCtrl,
                    hintText: '',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Balance Amount",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Customtextfield(
                    controller: ctr.balanceAmountCtrl,
                    hintText: '',
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Treatment Date",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Datepicker(
                    onDateChanged: (value) {
                      log("date:$value");
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Treatment Time",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 4,
                    children: [
                      Expanded(
                        child: HourDropdown(
                          onChanged: (String? value) {
                            log("hr:$value");
                          },
                        ),
                      ),

                      Expanded(
                        child: MinuteDropdown(
                          onChanged: (String? value) {
                            log("min:$value");
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Button(
              title: 'Save',
              onTap: () async {
                // await ctr.registerPatient();
                Get.to(() => PatientPdfPreviewPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
