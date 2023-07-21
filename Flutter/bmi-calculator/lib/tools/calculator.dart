import 'dart:math';

class Calculator {
  final int height;
  final int weight;

  double _bmi;

  Calculator({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Acima do peso';
    else if (_bmi > 18.5)
      return 'Peso ideal';
    else
      return 'Abaixo do peso';
  }

  String getDescription() {
    if (_bmi >= 25)
      return 'Você possui um peso acima do ideal. Tente se exercitar mais frequentemente!';
    else if (_bmi > 18.5)
      return 'Você está no peso ideal para o seu corpo. Bom trabalho!';
    else
      return 'Você está abaixo do peso ideal para o seu corpo. Tente se alimentar mais frequentemente de forma saudável!';
  }
}
