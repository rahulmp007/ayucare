import 'package:flutter/material.dart';

class HourDropdown extends StatefulWidget {
  final ValueChanged<String?> onChanged;

  const HourDropdown({super.key, required this.onChanged});

  @override
  _HourDropdownState createState() => _HourDropdownState();
}

class _HourDropdownState extends State<HourDropdown> {
  String? selectedHour;
  bool isDropdownOpen = false;

  final List<String> hours = List.generate(
    24,
    (index) => index.toString().padLeft(2, '0'),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0x40D9D9D9),
        border: Border.all(color: const Color(0x1A000000), width: 0.85),
        borderRadius: BorderRadius.circular(8.53),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          value: selectedHour,
          hint: const Text(
            "HH",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
          isExpanded: true,
          onTap: () {
            setState(() => isDropdownOpen = true);
          },
          onChanged: (value) {
            setState(() {
              selectedHour = value;
              isDropdownOpen = false;
            });
            widget.onChanged(value);
          },
          items: hours.map((hour) {
            return DropdownMenuItem(
              value: hour,
              child: Text(
                hour,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
