import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOpt extends StatelessWidget {
  final ValueChanged<int> onOptionSelected;

  const PaymentOpt({super.key, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Radio<int>(
              //   value: 1,
              //   groupValue: controller.selectedOption.value,
              //   onChanged: (value) {
              //     controller.setSelectedOption(value!);
              //     onOptionSelected(value);
              //   },
              // ),
              const Text('Cash'),
            ],
          ),

          Row(
            children: [
              // Radio<int>(
              //   value: 2,
              //   groupValue: controller.selectedOption.value,
              //   onChanged: (value) {
              //     controller.setSelectedOption(value!);
              //     onOptionSelected(value);
              //   },
              // ),
              const Text('Card'),
            ],
          ),

          Row(
            children: [
              // Radio<int>(
              //   value: 3,
              //   groupValue: controller.selectedOption.value,
              //   onChanged: (value) {
              //     controller.setSelectedOption(value!);
              //     onOptionSelected(value);
              //   },
              // ),
              const Text('UPI'),
            ],
          ),
        ],
      ),
    );
  }
}
