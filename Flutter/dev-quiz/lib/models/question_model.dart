import 'dart:convert';

import 'package:dev_quiz/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  bool isAnswered = false;
  AnswerModel? selectedAnswer;

  QuestionModel({required this.title, required this.answers})
      : assert(answers.where((element) => element.isRight == true).length == 1);

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'answers': this.answers,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(
        map['answers'].map(
          (answer) => AnswerModel.fromMap(answer),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
