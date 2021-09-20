import 'package:flutter/material.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget drawerOption(String text, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        text,
        style: TextStyle(fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold, fontSize: 26),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            //how the child of the container aligned
            //horizontal: left, vertical: center
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(10),
            color: UMYellow,
            child: Text(
              'Cooking Up!',
              //because we define the w900 in yaml file, so we don't need to specify the font family
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: UMBlue),
            ),
          ),
          SizedBox(height: 20),
          drawerOption('Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed('/');
          }),
          drawerOption('Filters', Icons.settings, (){
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
