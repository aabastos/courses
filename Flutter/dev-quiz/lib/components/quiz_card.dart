import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String image;
  final int totalQuestions;
  final int answeredQuestions;
  final VoidCallback? onTap;

  const QuizCard({
    Key? key,
    required this.title,
    required this.image,
    this.totalQuestions = 0,
    this.answeredQuestions = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap ?? () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                child: Image.asset(this.image),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                this.title,
                style: AppTextStyles.heading15,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    '${this.answeredQuestions} de ${this.totalQuestions}',
                    style: AppTextStyles.body11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: this.answeredQuestions / this.totalQuestions,
                      backgroundColor: AppColors.chartSecondary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.chartPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
