import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Home/my_theme.dart';

class CategoryDM {
  String id;
  String title;
  String image;
  Color color;
  CategoryDM(
      {required this.id, required, required this.title, required this.image, required this.color});

  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          id: 'sports',
          title: 'Sports',
          image: 'assets/ball.png',
          color: MyTheme.red),
      CategoryDM(
          id: 'general', title: 'General', image: 'assets/Politics.png', color: MyTheme.darkblue),
      CategoryDM(id: 'health', title: 'Health', image: 'assets/health.png', color: MyTheme.pink),
      CategoryDM(
          id: 'business', title: 'Business', image: 'assets/bussines.png', color: MyTheme.brown),
      CategoryDM(
          id: 'entertainment',
          title: 'Entertainment',
          image: 'assets/environment.png',
          color: MyTheme.blue),
      CategoryDM(
          id: 'science', title: 'Science', image: 'assets/science.png', color: MyTheme.yellow),
      CategoryDM(
          id: 'technology', title: 'Technology', image: 'assets/science.png', color: MyTheme.gray),
    ];
  }
}
