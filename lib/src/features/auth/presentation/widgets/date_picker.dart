import 'package:flutter/material.dart';

class Datepicker extends StatefulWidget {
  final ValueChanged<DateTime?>? onDateChanged; // Callback

  const Datepicker({super.key, this.onDateChanged});

  @override
  State<Datepicker> createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    DateTime initialDate = selectedDate ?? DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.green,
              onPrimary: Colors.white,
              onSurface: Colors.black, // Default text color
            ),
            dialogTheme: DialogThemeData(backgroundColor: Colors.white),
          ),
          child: child!,
        );
      },
    );

    setState(() {
      selectedDate = picked;
    });
    // Trigger callback
    widget.onDateChanged?.call(selectedDate);
    }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0x40D9D9D9), // background: #D9D9D940
          borderRadius: BorderRadius.circular(8.53),
          border: Border.all(
            color: const Color(0x1A000000), // border: #0000001A
            width: 0.85,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? "Select Date"
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset("assets/icons/minical.png"),
            ),
          ],
        ),
      ),
    );
  }
}
