import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import 'screens/category_meals_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };
  List<MealModel> _currentMeals = DUMMY_MEALS;

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _currentMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: basicTheme(),
      home: TabsScreen(),
      routes: {
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(currentMeals: _currentMeals,),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(setFilters: setFilters, currentFilters: _filters),
      },
    );
  }
}
