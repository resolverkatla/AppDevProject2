import 'package:flutter/material.dart';
// import '../models/category_models.dart';

//  @override
//   _HomePageState createState() => _HomePageState();
// }


// class _HomePageState extends State<HomePage> {
//   List<CategoryModel> categories = [];

//   @override
//   void initState() {
//     super.initState();
//     _getCategories();
//   }


// void _getCategories() {
//   categories = CategoryModel.getCategories();
// }

class CategoryModel {
  String name;
  String imagePath;
  Color boxColor;


  CategoryModel({
    required this.name,
    required this.imagePath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Salad',
        imagePath: 'assets/icons/salad.svg',
        boxColor: Colors.green
      )
    );


    categories.add(
      CategoryModel(
        name: 'Salad',
        imagePath: 'images/mountain.jpeg',
        boxColor: Colors.red
      )
    );

    categories.add(
      CategoryModel(
        name: 'Salad',
        imagePath: 'assets/icons/salad.svg',
        boxColor: Colors.black
      )
    );

  return categories;
  } 
}