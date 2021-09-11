import 'package:flutter/material.dart';
import 'package:meal_app/utilities/theme_constants.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title, style: Theme.of(context).textTheme.caption),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
