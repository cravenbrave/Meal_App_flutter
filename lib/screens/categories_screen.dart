import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      //used to define each grid's properties
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //each grid use how many pixels
          maxCrossAxisExtent: 200,
          //ratio btw height / width
          childAspectRatio: 3 / 2,
          //spacing btw grids: height and width
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES.map((each) => CategoryItem(each.title, each.color, each.id, each.imageUrl)).toList(),
    );
  }
}
