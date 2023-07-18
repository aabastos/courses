import 'package:expense_tracker/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:expense_tracker/domain/expenses/enums/index.dart';

const uuid = Uuid();

const Map<Category, IconData> categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return DateFormatter.formatDate(date);
  }

  IconData get categoryIcon {
    return categoryIcons[category]!;
  }
}
