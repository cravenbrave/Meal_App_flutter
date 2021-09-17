import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
class MealDetailScreen extends StatelessWidget {
  static const routeName = '/MealDetailScreen';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MealModel meal = ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
        children: meal.steps.map((e) => Text(e)).toList(),
      ),
    );
  }
}
