import 'package:flutter/material.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = '/filters-screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget filterOption(String title, String subtitle, bool value, VoidCallback setHandler) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (newVal) {
          setValue(newVal, value);
        });
  }

  void setValue(bool newValue, bool value) {
    setState(() {
      value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Filters')),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection', style: basicTheme().textTheme.headline2),
          ),
          Expanded(
              child: ListView(
            children: [
              filterOption('Gluten-free', 'Only include gluten-free meals', _glutenFree, setValue),
              filterOption('Vegan', 'Only include vegan meals', _vegan, setValue)],
          )),
        ],
      ),
    );
  }
}
