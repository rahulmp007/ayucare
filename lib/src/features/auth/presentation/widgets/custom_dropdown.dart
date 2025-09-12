import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        initialValue: selectedValue,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.black54, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.53),
            borderSide: const BorderSide(color: Color(0x1A000000), width: 0.85),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.53),
            borderSide: const BorderSide(color: Color(0x1A000000), width: 0.85),
          ),
        ),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: GoogleFonts.poppins(fontSize: 16)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
