import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/footer_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({this.bmiResult, this.resultText, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CardContainer(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    this.resultText,
                    style: kStatusTextStyle,
                  ),
                  Text(
                    this.bmiResult,
                    style: kResultNumberTextStyle,
                  ),
                  Text(
                    this.interpretation,
                    style: kResultDescriptionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          FooterButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'RECALCULAR',
          )
        ],
      ),
    );
  }
}
