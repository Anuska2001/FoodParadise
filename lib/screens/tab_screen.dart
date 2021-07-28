import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';


class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   List<Map<String, dynamic>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title':'Categories'},
    {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'},
  ];
    // TODO: implement initState
    super.initState();
  }
 
void _selectPage(int index)
{
  setState(() {
    _selectedPageIndex = index;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),
        
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories')
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('Favorites'),
            ),
          ],
        ),
        
      );
    
  }
}