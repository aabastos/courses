import 'package:flutter/material.dart';
import 'package:meals/screens/categories/index.dart';
import 'package:meals/themes/index.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme.lightTheme,
      home: CategoriesScreen(),
    );
  }
}
