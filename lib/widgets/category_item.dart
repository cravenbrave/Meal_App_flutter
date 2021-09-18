import 'package:flutter/material.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final String imageUrl;
  CategoryItem(this.title, this.color, this.id, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealScreen.routeName, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: UMBlue,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // padding: const EdgeInsets.all(15),
        child: Stack(children: [
          Image.network(imageUrl, fit: BoxFit.cover,),
          Container(
            width: MediaQuery.of(context).size.width * 0.32,
            color: Colors.black54,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.start,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          )
          // Text(title, style: Theme.of(context).textTheme.caption),
        ]),
        // decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.5), color], begin: Alignment.topLeft, end: Alignment.bottomRight), borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
