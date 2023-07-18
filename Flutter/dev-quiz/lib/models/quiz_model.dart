import 'dart:convert';
import 'dart:developer';

import 'package:dev_quiz/models/question_model.dart';

enum Level { easy, medium, hard, very_hard, none }

Level parseLevel(String level) {
  switch (level) {
    case 'easy':
      return Level.easy;
    case 'medium':
      return Level.medium;
    case 'hard':
      return Level.hard;
    case 'very_hard':
      return Level.very_hard;
  }

  return Level.none;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final String image;
  final Level level;

  int questionAnswered;

  QuizModel({
    required this.title,
    required this.questions,
    required this.image,
    required this.level,
    this.questionAnswered = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'questions': this.questions,
      'image': this.image,
      'level': this.level,
      'questionAnswered': this.questionAnswered,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      image: 'assets/images/${map['image']}.png',
      questionAnswered: map['questionAnswered'],
      level: parseLevel(map['level']),
      questions: List<QuestionModel>.from(
        map['questions'].map(
          (question) => QuestionModel.fromMap(question),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
