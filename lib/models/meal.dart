import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard
}

enum Affordability{
  Affordable,
  Pricey,
  Luxurious
}

class Meal{
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required required this.id, 
    @required required this.categories, 
    @required  required this.ingredients, 
    @required required this.title, 
    @required required this.imageUrl, 
    @required required this.steps,
    @required required this.duration, 
    @required required this.complexity, 
    @required required this.affordability, 
    @required required this.isGlutenFree, 
    @required required this.isLactoseFree, 
    @required required this.isVegan,
    @required required this.isVegetarian,
    });
}