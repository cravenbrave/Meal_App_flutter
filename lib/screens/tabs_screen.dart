import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/utilities/theme_constants.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

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
            title: Text('Deli Meal', style: TextStyle(color: UMBlue)),
            backgroundColor: UMYellow,
          ),
          bottomNavigationBar: TabBar(
            labelColor: UMBlue,
            indicator: BoxDecoration(color: UMYellow),
            tabs: [
              const Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              const Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(),
            ],
          ),
        ));
  }
}
