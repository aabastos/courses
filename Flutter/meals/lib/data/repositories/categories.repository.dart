import 'package:flutter/material.dart';
import 'package:meals/data/domain/index.dart';
import 'package:meals/models/index.dart';

class CategoriesRepository implements Categories {
  static List<Category> categories = [
    const Category(id: 'c1', title: 'Italian', color: Colors.purple),
    const Category(id: 'c2', title: 'Quick & Easy', color: Colors.red),
    const Category(id: 'c3', title: 'Hamburgers', color: Colors.orange),
    const Category(id: 'c4', title: 'German', color: Colors.amber),
    const Category(id: 'c5', title: 'Light & Lovely', color: Colors.blue),
    const Category(id: 'c6', title: 'Exotic', color: Colors.green),
    const Category(id: 'c7', title: 'Breakfast', color: Colors.lightBlue),
    const Category(id: 'c8', title: 'Asian', color: Colors.lightGreen),
    const Category(id: 'c9', title: 'French', color: Colors.pink),
    const Category(id: 'c10', title: 'Summer', color: Colors.teal),
  ];

  @override
  List<Category> getAll() {
    return categories;
  }
}
