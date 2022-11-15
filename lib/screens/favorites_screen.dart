import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/mealitem.dart';


class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeal ;

  FavoritesScreen(this.favoriteMeal) ;

  @override
  Widget build(BuildContext context) {

    if (favoriteMeal.isEmpty){
      return const Center(
      child: Text('You have not any itam yet...'),
    );
    }
    else{
      return ListView.builder(
        itemCount: favoriteMeal.length,
        itemBuilder: (ctx,index){
        return MealItem(
          id: favoriteMeal[index].id,
          imageUrl: favoriteMeal[index].imageUrl , 
          title: favoriteMeal[index].title, 
          duration: favoriteMeal[index].duration, 
          complexity: favoriteMeal[index].complexity, 
          affordability: favoriteMeal[index].affordability,
          );
        },
      );
    }
    }
}