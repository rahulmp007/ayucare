import 'package:ayucare/src/features/bookings/controller/bookings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOpt extends StatelessWidget {
  final ValueChanged<int> onOptionSelected;

  const PaymentOpt({super.key, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.find<BookingsController>();
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Radio<int>(
                value: 1,
                groupValue: ctr.paymentOption.value,
                onChanged: (value) {
                  if (value != null) {
                    ctr.setPaymentOption(value);
                    onOptionSelected(value);
                  }
                },
              ),
              const Text('Cash'),
            ],
          ),

          Row(
            children: [
              Radio<int>(
                value: 2,
                groupValue: ctr.paymentOption.value,
                onChanged: (value) {
                  if (value != null) {
                    ctr.setPaymentOption(value);
                    onOptionSelected(value);
                  }
                },
              ),
              const Text('Card'),
            ],
          ),

          Row(
            children: [
              Radio<int>(
                value: 3,
                groupValue: ctr.paymentOption.value,
                onChanged: (value) {
                  if (value != null) {
                    ctr.setPaymentOption(value);
                    onOptionSelected(value);
                  }
                },
              ),
              const Text('UPI'),
            ],
          ),
        ],
      );
    });
  }
}
