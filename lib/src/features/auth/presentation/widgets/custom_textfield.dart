import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const Customtextfield({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: Colors.black54, fontSize: 14),
          filled: true,
          fillColor: const Color(0x40D9D9D9), 
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.53),
            borderSide: const BorderSide(
              color: Color(0x1A000000), 
              width: 0.85,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.53),
            borderSide: const BorderSide(color: Color(0x1A000000), width: 0.85),
          ),
        ),
      ),
    );
  }
}
