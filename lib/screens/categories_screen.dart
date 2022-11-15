import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummydata.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((catgData){
         return CategoryItem(catgData.id , catgData.title, catgData.color);
        }).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}