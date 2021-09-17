import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/utilities/theme_constants.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/MealDetailScreen';
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget textTitle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(text, style: basicTheme().textTheme.headline1),
    );
  }

  Widget textContent(Widget child) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final MealModel meal = ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(title: FittedBox(child: Text(meal.title)), backgroundColor: UMYellow),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            textTitle(context, 'Ingredients'),
            textContent(ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: UMBlue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(meal.ingredients[index], style: basicTheme().textTheme.bodyText2!.copyWith(color: Colors.white)),
                      ));
                })),
            textTitle(context, 'Steps'),
            textContent(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${index + 1}',
                            style: basicTheme().textTheme.bodyText2!.copyWith(color: Colors.white),
                          ),
                          backgroundColor: UMBlue,
                        ),
                        title: Text(meal.steps[index], style: basicTheme().textTheme.bodyText2),
                      ),
                      Divider(),
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }
}
