import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/components/score_card.dart';
import 'package:dev_quiz/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final UserModel? user;

  const AppBarWidget({Key? key, this.user}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(250);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          UserInfo(
            user: user ?? new UserModel(name: 'Usuário Padrão', photoUrl: ''),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ScoreCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final UserModel user;

  const UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: AppGradients.linear,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.title,
                ),
                TextSpan(
                  text: user.name,
                  style: AppTextStyles.titleBold,
                ),
              ],
            ),
          ),
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(user.photoUrl),
              ),
            ),
          )
        ],
      ),
    );
  }
}
