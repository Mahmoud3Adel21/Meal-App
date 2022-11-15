import 'package:flutter/material.dart';
import 'dummydata.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/categorymealscreen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Filter 

  Map <String,bool>_filters={
    'Gluten':false,
    'Lactose':false,
    'Vegetarian':false,
    'Vegen':false,
  };

  List<Meal> _availableMeal =DUMMY_MEALS;


  List<Meal> _FavoriteMeal =[];

  void _setfilters(Map <String,bool>_filtersData){
    setState(() {
      _filters =_filtersData;
      _availableMeal=DUMMY_MEALS.where((meal) {
        if(_filters['Gluten'] && !meal.isGlutenFree) return false ;
        if(_filters['Lactose'] && !meal.isLactoseFree) return false ;
        if(_filters['Vegetarian'] && !meal.isVegetarian) return false ;
        if(_filters['Vegen'] && !meal.isVegan) return false ;
        return true;
      }).toList();
    });
  }

  // Favorite

  void _toggleFavorite(String mealId){
    final existingIndex= _FavoriteMeal.indexWhere((meal) =>meal.id ==mealId );

    if(existingIndex>=0){
      setState(() {
        _FavoriteMeal.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _FavoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id ==mealId ));
      });
    }
  }

  bool _isMealFav (String id){
    return _FavoriteMeal.any((meal) => meal.id == id );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light, 
          primary: Colors.pink, onPrimary: Colors.white,
          secondary: Colors.amber, onSecondary: Colors.black,
          error: Colors.red, onError: Colors.white,
          background: Colors.purple, onBackground: Colors.white,
          surface: Colors.orange, onSurface: Colors.white
          ),


        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color:  Color.fromRGBO(20, 50, 50, 1),
          ),
          bodyText2: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          
          
        )
      ),
      //home: CategoriesScreen() ,
      routes: {
        '/':(context) => TabScreen(_FavoriteMeal),//the initial page == home:***
        CategoryMealScreen.routeName: ((context) => CategoryMealScreen(_availableMeal)),
        MealDetailScreen.routeName:(((context) => MealDetailScreen(_toggleFavorite,_isMealFav))),
        FilterScreen.routeName:(((context) => FilterScreen(_setfilters,_filters))),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Meal App'),

      ) ,
      body:  CategoriesScreen(),
      
    );
  }
}