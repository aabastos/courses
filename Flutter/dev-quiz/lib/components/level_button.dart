import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const LevelButton({
    Key? key,
    required this.buttonText,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: this.backgroundColor,
        border: Border.fromBorderSide(
          BorderSide(
            color: this.borderColor,
          ),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Text(
        this.buttonText,
        style: GoogleFonts.notoSans(
          color: this.textColor,
        ),
      ),
    );
  }
}
