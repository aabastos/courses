import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color borderColor;
  final Color color;
  final bool enabled;
  final VoidCallback? onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.color = Colors.white,
    this.enabled = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: this.enabled ? this.color : this.color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: this.enabled
                ? this.borderColor
                : this.borderColor.withOpacity(0.1),
          ),
        ),
        child: TextButton(
          onPressed: this.enabled ? this.onPressed : () {},
          child: Text(
            this.text,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: this.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
