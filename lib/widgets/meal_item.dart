import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
class MealItem extends StatelessWidget {
  final MealModel meal;
  const MealItem({Key? key, required this.meal}) : super(key: key);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }
  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: meal);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  child: Image.network(meal.imageUrl, fit: BoxFit.cover, height: 200, width: double.infinity),
                ),
                //used to position the widget
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        meal.title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        textAlign: TextAlign.right,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} mins'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.receipt),
                      SizedBox(width: 6),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
