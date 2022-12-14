import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  
  final String id ;
  final String imageUrl ;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

   MealItem({
   @required this.id,
   @required this.imageUrl, 
   @required this.title, 
   @required this.duration, 
   @required this.complexity, 
   @required this.affordability,

}) ;
  
  String get complexityText{
    switch(complexity){   //switch instead of If because we have many cases
      case Complexity.Simple :return 'Simple' ; break;
      case Complexity.Hard :return 'Hard' ; break;
      case Complexity.Challenging :return 'Challenging' ; break;

      default :return 'Simple' ; break;
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable :return 'Affordable' ; break;
      case Affordability.Luxurious :return 'Luxurious' ; break;
      case Affordability.Pricey :return 'Pricey' ; break;

      default :return 'Simple' ; break;
    }
  }
  
  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
      ).then((result) {
       // if(result != null) removeItem(result);
      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height:200 ,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 25,color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      ),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5,),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 5,),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 5,),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}