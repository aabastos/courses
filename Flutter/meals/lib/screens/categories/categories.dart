import 'package:flutter/material.dart';
import 'package:meals/data/domain/index.dart';
import 'package:meals/data/repositories/index.dart';
import 'package:meals/models/index.dart';
import 'package:meals/widgets/molecules/app_bar/index.dart';

class CategoriesScreen extends StatelessWidget {
  final Categories categoriesDomain = CategoriesRepository();
  final List<Category> categories = [];

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text('data'),
        ],
      ),
    );
  }
}
