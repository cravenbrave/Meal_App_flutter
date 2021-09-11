import 'package:flutter/material.dart';
import 'package:meal_app/utilities/theme_constants.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;

  const CategoryModel(
      {required this.id, required this.title, this.color = UMYellow});
}
