import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';
  CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(title: Text('$categoryTitle Recipes')),
      body: Center(
        child: Text('Recipes for the $categoryTitle category.'),
      ),
    );
  }
}
