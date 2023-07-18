import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentQuestion;
  final int answeredQuestions;
  final int questionsQuantity;

  const QuestionIndicator({
    Key? key,
    this.currentQuestion = 0,
    this.answeredQuestions = 0,
    this.questionsQuantity = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão ${this.currentQuestion.toString().padLeft(2, '0')}',
                style: AppTextStyles.body,
              ),
              Text(
                'de ${this.questionsQuantity.toString().padLeft(2, '0')}',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          LinearProgressIndicator(
            value: answeredQuestions / questionsQuantity,
            backgroundColor: AppColors.chartSecondary,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          )
        ],
      ),
    );
  }
}
