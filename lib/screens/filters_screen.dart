import 'package:flutter/material.dart';
import 'package:meal_app/utilities/theme_constants.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  Function setFilters;
  Map<String, bool> currentFilters;
  FiltersScreen({Key? key, required this.setFilters, required this.currentFilters}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget filterOption(String title, String subtitle, bool value, Function(bool) setHandler) {
    return SwitchListTile(title: Text(title), subtitle: Text(subtitle), value: value, onChanged: setHandler);
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Filters', style: basicTheme().textTheme.headline3)),
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
              filterOption('Gluten-free', 'Only include gluten-free meals', _glutenFree, (newVal) {
                setState(() {
                  _glutenFree = newVal;
                });
              }),
              filterOption('Vegan', 'Only include vegan meals', _vegan, (newVal) {
                setState(() {
                  _vegan = newVal;
                });
              }),
              filterOption('Vegetarian', 'Only include vegetarian meals', _vegetarian, (newVal) {
                setState(() {
                  _vegetarian = newVal;
                });
              }),
              filterOption('Lactose Free', 'Only include lactose free meals', _lactoseFree, (newVal) {
                setState(() {
                  _lactoseFree = newVal;
                });
              }),
              SizedBox(height: 30),
              ElevatedButton(onPressed: (){
                final _filters = {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'lactose': _lactoseFree,
                  'vegetarian': _vegetarian,
                };
                widget.setFilters(_filters);
                Navigator.pushReplacementNamed(context, '/');
              }, child: Text('Save', style: basicTheme().textTheme.caption!.copyWith(color: UMBlue))),
            ],
          )),
        ],
      ),
    );
  }
}
