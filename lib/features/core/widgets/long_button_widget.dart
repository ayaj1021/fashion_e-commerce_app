import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongButtonContainer extends StatelessWidget {
  const LongButtonContainer({
    required this.buttonName,
    this.buttonColor,
    super.key,
    this.buttonBorder,
    this.buttonTextColor,
    this.icon,
  });
  final String buttonName;
  final Color? buttonColor;
  final Border? buttonBorder;
  final Color? buttonTextColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          border: buttonBorder,
          borderRadius: BorderRadius.circular(20),
          color: buttonColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            buttonName,
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: buttonTextColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
