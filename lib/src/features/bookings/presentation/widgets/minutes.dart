import 'package:flutter/material.dart';

class MinuteDropdown extends StatefulWidget {
  final ValueChanged<String?> onChanged;

  const MinuteDropdown({super.key, required this.onChanged});

  @override
  _MinuteDropdownState createState() => _MinuteDropdownState();
}

class _MinuteDropdownState extends State<MinuteDropdown> {
  String? selectedMinute;
  bool isDropdownOpen = false;

  final List<String> minutes = List.generate(
    60,
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
          value: selectedMinute,
          hint: const Text(
            "MM",
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
              selectedMinute = value;
              isDropdownOpen = false;
            });
            widget.onChanged(value);
          },
          items: minutes.map((minute) {
            return DropdownMenuItem(
              value: minute,
              child: Text(
                minute,
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
