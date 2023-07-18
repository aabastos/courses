import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Chart(),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vamos começar',
                  style: AppTextStyles.heading,
                ),
                Text(
                  'Complete os desafios e avance em conhecimento',
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              value: 0.75,
            ),
          ),
          Center(
            child: Text(
              '75%',
              style: AppTextStyles.heading,
            ),
          ),
        ],
      ),
    );
  }
}
