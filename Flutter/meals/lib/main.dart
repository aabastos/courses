import 'package:flutter/material.dart';
import 'package:meals/theme/index.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme.lightTheme,
      home: const Scaffold(),
    );
  }
}
