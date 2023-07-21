import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      onGenerateRoute: (RouteSettings settings) {
        dynamic args = settings.arguments;

        var routes = <String, WidgetBuilder>{
          '/': (context) => InputPage(),
          '/results': (context) => ResultPage(
                bmiResult: args["bmiResult"],
                resultText: args["resultText"],
                interpretation: args["interpretation"],
              )
        };

        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
