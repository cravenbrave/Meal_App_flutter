import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<MealModel> favoriteMeals;
  const FavoritesScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('You have no favorites meals yet.', style: basicTheme().textTheme.headline3),
        SizedBox(height: 20,),
        Text('Add some!', style: basicTheme().textTheme.headline3)
      ],);
    }

    return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(meal: favoriteMeals[index]);
        });
  }
}
