import 'package:dev_quiz/controllers/home_controller.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/components/app_bar.dart';
import 'package:dev_quiz/components/level_button.dart';
import 'package:dev_quiz/components/quiz_card.dart';
import 'package:dev_quiz/screens/challenge_screen.dart';
import 'package:flutter/material.dart';

enum HomeState { loading, success, error, empty }

class HomeScreen extends StatefulWidget {
  static String id = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeState state = HomeState.loading;
  final controller = HomeController();

  void initData() async {
    state = HomeState.loading;

    try {
      await controller.getUser();
      await controller.getQuizzes();

      setState(() {
        state = HomeState.success;
      });
    } catch (err) {
      setState(() {
        state = HomeState.error;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    if (state == HomeState.success)
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user,
        ),
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              LevelButtons(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  children: controller.quizzes!
                      .map(
                        (quiz) => QuizCard(
                          title: quiz.title,
                          image: quiz.image,
                          totalQuestions: controller.quizzes!.length,
                          answeredQuestions: quiz.questionAnswered,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ChallengeScreen.id,
                              arguments: quiz,
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    else if (state == HomeState.loading)
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    else
      return Container();
  }
}

class LevelButtons extends StatelessWidget {
  const LevelButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LevelButton(
          buttonText: 'Fácil',
          backgroundColor: AppColors.levelButtonFacil,
          borderColor: AppColors.levelButtonBorderFacil,
          textColor: AppColors.levelButtonTextFacil,
        ),
        LevelButton(
          buttonText: 'Médio',
          backgroundColor: AppColors.levelButtonMedio,
          borderColor: AppColors.levelButtonBorderMedio,
          textColor: AppColors.levelButtonTextMedio,
        ),
        LevelButton(
          buttonText: 'Difícil',
          backgroundColor: AppColors.levelButtonDificil,
          borderColor: AppColors.levelButtonBorderDificil,
          textColor: AppColors.levelButtonTextDificil,
        ),
        LevelButton(
          buttonText: 'Perito',
          backgroundColor: AppColors.levelButtonPerito,
          borderColor: AppColors.levelButtonBorderPerito,
          textColor: AppColors.levelButtonTextPerito,
        ),
      ],
    );
  }
}
