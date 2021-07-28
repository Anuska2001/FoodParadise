import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilters;

  FilterScreen(this.currentFilters,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian']?? false;
    _vegan = widget.currentFilters['vegan']?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title, 
    String description, 
    bool currentValue, 
    Function(bool) updateValue)
    {
    return SwitchListTile(
            title: Text(title),
            value: currentValue,
            subtitle: Text(description),
            onChanged: updateValue,
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text('Your Filters'),
      actions: <Widget>[
        IconButton( 
          icon: Icon(Icons.save),
          onPressed: (){
            final selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegetarian' : _vegetarian,
                };
            widget.saveFilters(selectedFilters);
          },
        )
      ],
      ),
      drawer: MainDrawer(),
      body:Column(
      children: <Widget>[
        Container(padding: EdgeInsets.all(20),
        child: Text('Adjust Your Meal Selection',
        style: Theme.of(context).textTheme.title,
        ),
        ),
        Expanded(child: ListView(
          children: <Widget>[
            _buildSwitchListTile(
              'Gluten-Free', 
              'Only include Gluten Free meals', 
              _glutenFree, 
              (newValue){
                setState(() {
                  _glutenFree = newValue;
                });
              }),
               _buildSwitchListTile(
              'Lactose-Free', 
              'Only include Lactose Free meals', 
              _lactoseFree, 
              (newValue){
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
               _buildSwitchListTile(
              'Vegetarian', 
              'Only include Vegetarian meals', 
              _vegetarian, 
              (newValue){
                setState(() {
                  _vegetarian = newValue;
                });
              }),
               _buildSwitchListTile(
              'Vegan', 
              'Only include Vegan meals', 
              _vegan, 
              (newValue){
                setState(() {
                  _vegan = newValue;
                });
              }),
          ],
        ))
      ])
    );
  }
}