import 'package:flutter/material.dart';
import 'package:meal_app/dummydata.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName= 'meal_detail';
  final Function toggleFavorite;
  final Function isFav;

   MealDetailScreen(this.toggleFavorite,this.isFav) ;

  Widget buildTitle (BuildContext context,String txt){
    return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(txt, style:Theme.of(context).textTheme.bodyText2 ,),
          );
  }

  Widget buildContainar(Widget child0){
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 200,
            width: 300,
            child: child0 ,);
  }

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =DUMMY_MEALS.firstWhere((meal) => meal.id==mealId,);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
              ),
            buildTitle(context, 'Ingredients'),
            buildContainar(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx,index){
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                }),
            ),
            buildTitle(context, 'Steps'),
            buildContainar(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx,index){
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index+1}'),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          foregroundColor: Colors.black,
                          ),
                        title: Text(selectedMeal.steps[index]),
                     ),
                     const Divider(height: 3,thickness: 5,),
                    ],
                  );
                }),)
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(
          isFav(mealId) ? Icons.star : Icons.star_border
          ),
        onPressed:()=> toggleFavorite(mealId) ,
      ),
    );
  }
}