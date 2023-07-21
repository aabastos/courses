import 'package:bmi_calculator/components/circular_button.dart';
import 'package:bmi_calculator/components/footer_button.dart';
import 'package:bmi_calculator/tools/calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/card.dart';
import '../constants.dart';
import '../components/gender_content_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kActiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  int height = 170;
  int weight = 60;
  int age = 20;

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
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = kActiveCardColor;
                        femaleCardColor = kInactiveCardColor;
                      });
                    },
                    child: CardContainer(
                      cardColor: maleCardColor,
                      cardChild: GenderContentCard(
                        icon: FontAwesomeIcons.mars,
                        text: 'MASCULINO',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleCardColor = kInactiveCardColor;
                        femaleCardColor = kActiveCardColor;
                      });
                    },
                    child: CardContainer(
                      cardColor: femaleCardColor,
                      cardChild: GenderContentCard(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMININO',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: CardContainer(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ALTURA',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      thumbColor: kSliderThumbColor,
                      overlayColor: kSliderThumbOverlayColor,
                      activeTrackColor: kSliderActiveTrackColor,
                      inactiveTrackColor: kSliderInactiveTrackColor,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kSliderMinValue,
                      max: kSliderMaxValue,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PESO',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CircularButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'IDADE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            CircularButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FooterButton(
            onTap: () {
              Calculator calc = new Calculator(
                height: this.height,
                weight: this.weight,
              );

              String bmiResult = calc.calculateBMI();
              String resultText = calc.getResult();
              String interpretation = calc.getDescription();
              Navigator.pushNamed(
                context,
                '/results',
                arguments: {
                  "bmiResult": bmiResult,
                  "resultText": resultText,
                  "interpretation": interpretation,
                },
              );
            },
            text: 'CALCULAR',
          )
        ],
      ),
    );
  }
}
