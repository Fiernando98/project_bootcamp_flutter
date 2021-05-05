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
}
