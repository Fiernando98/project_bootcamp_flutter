import 'package:flutter/cupertino.dart';

Iterable<String> get languagesSupported => ['en', 'es'];

abstract class Translates {
  static Translates? of(BuildContext context) {
    return Localizations.of<Translates>(context, Translates);
  }

  String get codeLanguage;

  String get foods;

  String get createFood;

  String get noFoodsAvailable;

  String get newFood;

  String get save;

  String get calories;

  String get errorInsideTheForm;

  String get successfullySavedFood;

  String get foodName;

  String get issueInName;

  String get enterFoodName;

  String get enterCalories;

  String get issueInCalories;
}
