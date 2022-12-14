import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(IconData icon,String txt,Function tapF){
    return ListTile(
            leading: Icon(icon,size: 26,),
            title: Text(txt,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),),
            onTap: tapF,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary,

              ),),
          ),
          const SizedBox(height: 20),
          buildListTile(
            Icons.restaurant,
            'Meal',
            (){Navigator.of(context).pushReplacementNamed('/');},
            ),
          buildListTile(
            Icons.settings,
            'Filter',
            (){Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);},
            ),
        ],
      ),
    );
  }
}