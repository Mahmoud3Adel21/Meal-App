import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/maindrawer.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> favoriteMeal ;

  const TabScreen(this.favoriteMeal) ;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Map<String, Object>> _pages;

  @override
  initState(){
    _pages= [
          {
              'page':CategoriesScreen(),
              'title':'Categories'
            },
            {
              'page':FavoritesScreen(widget.favoriteMeal),
              'title':'Favorites'
            },
    ];
    super.initState();
  }

  int selectedPageindex =0;
  
  void selectPage(int val){
    setState(() {
      selectedPageindex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageindex]['title']),
      ),
      body: _pages[selectedPageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageindex,
        onTap: selectPage,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
            ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}