import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RightAnswerScreen extends StatelessWidget {
  static String id = 'right-answer-screen';

  const RightAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.check,
                width: 120,
                height: 120,
              ),
              SizedBox(height: 24),
              Text(
                'Acertou!',
                style: AppTextStyles.heading40,
              ),
              SizedBox(height: 24),
              Text(
                'Parabéns! Você acertou a resposta desta pergunta!',
                style: AppTextStyles.body20,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 60)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Avançar',
                    style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
