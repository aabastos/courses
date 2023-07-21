import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class GenderContentCard extends StatelessWidget {
  final IconData icon;
  final String text;

  GenderContentCard({@required this.icon, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
