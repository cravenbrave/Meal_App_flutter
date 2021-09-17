import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:meal_app/utilities/theme_constants.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categoryIds.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text('$categoryTitle Recipes'), backgroundColor: UMYellow,),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
            itemBuilder: (context, index){
            return MealItem(meal: categoryMeals[index]);
            }),
      ),
    );
  }
}
