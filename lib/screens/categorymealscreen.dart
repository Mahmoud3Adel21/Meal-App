import 'package:flutter/material.dart';
import 'package:meal_app/dummydata.dart';
import 'package:meal_app/widgets/mealitem.dart';

import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {

  static const routeName= 'categorymeals';

  final List<Meal> availabeMeal;

  const CategoryMealScreen(this.availabeMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayedMeals ;

  @override
  void didChangeDependencies() {
    final routeArg =ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryID=routeArg['id'];
    categoryTitle=routeArg['title'];
    displayedMeals = widget.availabeMeal.where((meal){
      return meal.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  } 

  
  @override
  Widget build(BuildContext context) {

    void _removeMeal(String mealId){
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id == mealId);
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx,index){
        return MealItem(
          id: displayedMeals[index].id,
          imageUrl: displayedMeals[index].imageUrl , 
          title: displayedMeals[index].title, 
          duration: displayedMeals[index].duration, 
          complexity: displayedMeals[index].complexity, 
          affordability: displayedMeals[index].affordability,
          );
        },
      ),
      
    );
  }
}