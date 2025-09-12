import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final bool? isLoading;
  final String title;
  final VoidCallback onTap;
  const Button({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 9,
          right: 9,
          top: isLoading == true ? 8 : 12,
          bottom: isLoading == true ? 8 : 12,
        ),
        decoration: BoxDecoration(
          color: Color(0xff006837),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading == true
            ? Center(
                child: Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
