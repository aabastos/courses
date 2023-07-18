import 'dart:convert';

import 'package:dev_quiz/models/quiz_model.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:flutter/services.dart';

class Api {
  Future<UserModel> getUser() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      final response = await rootBundle.loadString('database/user.json');
      final user = UserModel.fromJson(response);

      return user;
    } catch (err) {
      throw err;
    }
  }

  Future<List<QuizModel>> getQuizzes() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final response = await rootBundle.loadString('database/quizzes.json');
      final list = jsonDecode(response) as List;

      final quizzes = list.map((quiz) => QuizModel.fromMap(quiz)).toList();

      return quizzes;
    } catch (err) {
      throw err;
    }
  }
}
