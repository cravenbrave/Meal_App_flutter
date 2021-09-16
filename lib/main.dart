import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import 'screens/category_meals_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: basicTheme(),
      home: CategoriesScreen(),
      routes: {
        // '/' : (context) => CategoriesScreen(),
        CategoryMealScreen.routeName : (context) => CategoryMealScreen(),
      },
    );
  }
}
