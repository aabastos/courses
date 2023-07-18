import 'package:dev_quiz/components/answer.dart';
import 'package:dev_quiz/components/question_indicator.dart';
import 'package:dev_quiz/components/rounded_button.dart';
import 'package:dev_quiz/controllers/challenge_controller.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/models/answer_model.dart';
import 'package:dev_quiz/models/question_model.dart';
import 'package:dev_quiz/models/quiz_model.dart';
import 'package:dev_quiz/screens/right_answer_screen.dart';
import 'package:dev_quiz/screens/wrong_answer_screen.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  static String id = 'challenge-screen';

  final QuizModel quiz;

  const ChallengeScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  late ChallengeController challengeController;
  late QuestionModel currentQuestion;

  AnswerModel? selectedAnswer;

  @override
  void initState() {
    super.initState();

    challengeController = new ChallengeController(
      questions: widget.quiz.questions,
    );
    currentQuestion = challengeController.getCurrentQuestion();

    verifyIfQuestionIsAlreadyAnswered();
  }

  void verifyIfQuestionIsAlreadyAnswered() {
    if (this.currentQuestion.isAnswered)
      this.selectedAnswer = this.currentQuestion.selectedAnswer;
  }

  void handleNext() {
    setState(() {
      currentQuestion = challengeController.getNextQuestion();

      verifyIfQuestionIsAlreadyAnswered();
    });
  }

  void handleConfirm() {
    if (this.selectedAnswer!.isRight)
      Navigator.pushNamed(context, RightAnswerScreen.id);
    else
      Navigator.pushNamed(context, WrongAnswerScreen.id);

    setState(() {
      widget.quiz.questionAnswered++;

      this.currentQuestion.selectedAnswer = this.selectedAnswer;
      this.currentQuestion.isAnswered = true;

      this.currentQuestion = challengeController.getNextQuestion();

      verifyIfQuestionIsAlreadyAnswered();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, left: 5),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.border,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: BackButton(),
              ),
              Expanded(
                child: QuestionIndicator(
                  currentQuestion:
                      challengeController.getCurrentQuestionNumber(),
                  answeredQuestions: widget.quiz.questionAnswered,
                  questionsQuantity: widget.quiz.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentQuestion.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            ...currentQuestion.answers.map(
              (answer) {
                final bool questionAnswered = currentQuestion.isAnswered;

                final bool isSelected = this.selectedAnswer != null
                    ? answer == this.selectedAnswer
                    : false;

                final bool isRight =
                    isSelected && questionAnswered && answer.isRight;

                final bool isWrong =
                    isSelected && questionAnswered && !answer.isRight;

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Answer(
                    answerText: answer.title,
                    isSelected: isSelected,
                    isRight: isRight,
                    isWrong: isWrong,
                    onTap: () {
                      setState(() {
                        this.selectedAnswer = answer;
                      });
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundedButton(
                text: 'Pular',
                borderColor: AppColors.border,
                textColor: AppColors.grey,
                onPressed: handleNext,
              ),
              SizedBox(
                width: 5,
              ),
              RoundedButton(
                text: 'Continuar',
                color: AppColors.darkGreen,
                borderColor: AppColors.darkGreen,
                onPressed: handleConfirm,
                enabled:
                    this.selectedAnswer != null && !currentQuestion.isAnswered,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
