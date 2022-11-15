import 'package:flutter/material.dart';
import 'package:meal_app/widgets/maindrawer.dart';

class FilterScreen extends StatefulWidget {

  static const routeName ='/filters';

  final Function saveFilters;
  final Map<String,bool> currentFilter;
  FilterScreen(this.saveFilters,this.currentFilter) ;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _isGlutenFree =false;
  bool _isLactoseFree =false;
  bool _isVegan =false;
  bool _isVegetarian =false;

  @override
  initState(){
    _isGlutenFree =widget.currentFilter['Gluten'];
    _isLactoseFree =widget.currentFilter['Lactose'];
    _isVegan =widget.currentFilter['Vegen'];
    _isVegetarian =widget.currentFilter['Vegetarian'];
    super.initState();
  }

  Widget buildlistTile(String title , bool currentval ,Function updateVal){
    return SwitchListTile(
                  value: currentval, 
                  title: Text(title ,style:Theme.of(context).textTheme.bodyText2),
                  subtitle: Text('Only include $title meals.'),
                  onChanged: updateVal,
                  inactiveTrackColor: Theme.of(context).colorScheme.primary,
                  activeTrackColor: Theme.of(context).colorScheme.secondary,
                  activeColor: Colors.white,
                  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt_rounded),
            onPressed: (){
              final selectedFilter ={
                'Gluten':_isGlutenFree,
                'Lactose':_isLactoseFree,
                'Vegetarian':_isVegetarian,
                'Vegen':_isVegan,
              };

              widget.saveFilters(selectedFilter);
            }, 
            )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal Selection .',
              style: Theme.of(context).textTheme.bodyText2,),
          ),
          Expanded(
            child: ListView(
              children: [
                buildlistTile(
                  'Gluten-Free',
                  _isGlutenFree , 
                  (newVal){setState(() {_isGlutenFree = newVal;});}),
                buildlistTile(
                  'Lactose-Free',
                  _isLactoseFree , 
                  (newVal){setState(() {_isLactoseFree = newVal;});}),
                buildlistTile(
                  'Vegetarian',
                  _isVegetarian , 
                  (newVal){setState(() {_isVegetarian = newVal;});}),
                buildlistTile(
                  'Vegan',
                  _isVegan , 
                  (newVal){setState(() {_isVegan = newVal;});}),
              ],
            ),
            )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}