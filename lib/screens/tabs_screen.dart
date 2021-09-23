import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Deli Meal', style: basicTheme().textTheme.headline3),
            backgroundColor: UMYellow,
          ),
          drawer: MainDrawer(),
          bottomNavigationBar: TabBar(
            labelColor: UMBlue,
            indicator: BoxDecoration(color: UMYellow),
            tabs: [
              const Tab(
                icon: Icon(Icons.category),
                child: Padding(child: Text('Categories', style: TextStyle(fontSize: 18)), padding: EdgeInsets.only(bottom: 8)),
              ),
              const Tab(
                icon: Icon(Icons.star),
                child: Padding(child: Text('Favorites', style: TextStyle(fontSize: 18)), padding: EdgeInsets.only(bottom: 8)),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(favoriteMeals: widget.favoriteMeals),
            ],
          ),
        ));
  }
}
