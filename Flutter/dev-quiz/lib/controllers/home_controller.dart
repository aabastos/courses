import 'package:dev_quiz/models/quiz_model.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:dev_quiz/service/api.dart';

class HomeController {
  Api api = new Api();
  UserModel? user;
  List<QuizModel>? quizzes;

  Future getUser() async {
    try {
      this.user = await api.getUser();
    } catch (err) {
      throw err;
    }

    return;
  }

  Future getQuizzes() async {
    try {
      this.quizzes = await api.getQuizzes();
    } catch (err) {
      throw err;
    }

    return;
  }
}
