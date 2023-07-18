import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final bool isSelected;
  final bool isRight;
  final bool isWrong;
  final VoidCallback? onTap;

  const Answer({
    Key? key,
    required this.answerText,
    this.isSelected = false,
    this.isRight = false,
    this.isWrong = false,
    this.onTap,
  }) : super(key: key);

  Color get answerBackgroundColor {
    if (isRight)
      return AppColors.lightGreen;
    else if (isWrong)
      return AppColors.lightRed;
    else
      return AppColors.white;
  }

  Color get answerBorderColor {
    if (isRight)
      return AppColors.darkGreen;
    else if (isWrong)
      return AppColors.darkRed;
    else if (isSelected)
      return AppColors.grey;
    else
      return AppColors.border;
  }

  TextStyle get answerTextColor {
    if (isRight)
      return AppTextStyles.bodyDarkGreen;
    else if (isWrong)
      return AppTextStyles.bodyDarkRed;
    else
      return AppTextStyles.body;
  }

  Color get answerCheckColor {
    if (isRight)
      return AppColors.darkGreen;
    else if (isWrong)
      return AppColors.darkRed;
    else if (isSelected)
      return AppColors.grey;
    else
      return AppColors.white;
  }

  Color get answerCheckBorderColor {
    if (isRight)
      return AppColors.darkGreen;
    else if (isWrong)
      return AppColors.darkRed;
    else if (isSelected)
      return AppColors.grey;
    else
      return AppColors.border;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: answerBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
              color: answerBorderColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                this.answerText,
                style: answerTextColor,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: answerCheckColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: answerCheckBorderColor,
                  ),
                ),
              ),
              child: Center(
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: AppColors.white,
                        size: 13,
                      )
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
