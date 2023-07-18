import 'package:dev_quiz/models/question_model.dart';

class ChallengeController {
  List<QuestionModel> questions;
  int currentQuestionIndex = 0;

  ChallengeController({required this.questions}) {
    this.currentQuestionIndex = 0;
  }

  int getCurrentQuestionNumber() {
    return this.currentQuestionIndex + 1;
  }

  QuestionModel getCurrentQuestion() {
    return questions[currentQuestionIndex];
  }

  QuestionModel getNextQuestion() {
    this.currentQuestionIndex++;
    return questions[currentQuestionIndex];
  }
}
