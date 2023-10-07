import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { home, office, study, regular }

final formatter = DateFormat.yMd();

const uuid = Uuid();

const categoryIcons = {
  Category.home: Icons.home,
  Category.office: Icons.work,
  Category.study: Icons.school,
  Category.regular: Icons.business_center_outlined,
};

class ToDoList {
  ToDoList({
    required this.title,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final Category category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
