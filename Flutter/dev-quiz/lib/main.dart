import 'package:dev_quiz/models/question_model.dart';
import 'package:dev_quiz/models/quiz_model.dart';
import 'package:dev_quiz/screens/challenge_screen.dart';
import 'package:dev_quiz/screens/home_screen.dart';
import 'package:dev_quiz/screens/right_answer_screen.dart';
import 'package:dev_quiz/screens/splash_screen.dart';
import 'package:dev_quiz/screens/wrong_answer_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevQuiz());
}

class DevQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      initialRoute: HomeScreen.id,
      onGenerateRoute: (RouteSettings settings) {
        final args = settings.arguments;

        var routes = <String, WidgetBuilder>{
          SplashScreen.id: (context) => SplashScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ChallengeScreen.id: (context) => ChallengeScreen(
                quiz: args as QuizModel,
              ),
          RightAnswerScreen.id: (context) => RightAnswerScreen(),
          WrongAnswerScreen.id: (context) => WrongAnswerScreen(),
        };

        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
