

import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';
import'../models/meal.dart';

class CategoryMealsName extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsName(this.availableMeals);

  @override
  _CategoryMealsNameState createState() => 
   _CategoryMealsNameState();
}

class _CategoryMealsNameState extends State<CategoryMealsName> {
  String? categoryTitle;
  List<Meal> displayedMeals = [] ;

  var _loadedInitData = false;

  @override
  void initState() {
    
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(!_loadedInitData)
    {
      final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
     categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    }
    
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId)
  {
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id == mealId);
      });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? ''),
      ),
      body: ListView.builder(itemBuilder:(ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title, 
              imageUrl: displayedMeals[index].imageUrl, 
              duration: displayedMeals[index].duration, 
              complexity: displayedMeals[index].complexity, 
              affordability: displayedMeals[index].affordability,
              );
      },itemCount:displayedMeals.length ,
      ),
    );
  }
}
