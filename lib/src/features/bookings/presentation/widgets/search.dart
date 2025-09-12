import 'package:flutter/material.dart';

class Searchbutton extends StatelessWidget {
  final VoidCallback onTap;
  const Searchbutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 85,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xff006837),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text("Search", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
