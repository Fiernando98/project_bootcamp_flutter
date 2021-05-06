import 'package:project_bootcamp_flutter/translates/translates.dart';

class LanguageEn extends Translates {
  final String _code;

  LanguageEn(this._code);

  @override
  String get codeLanguage => _code;

  @override
  String get foods => "Foods";

  @override
  String get createFood => "Create Food";

  @override
  String get noFoodsAvailable => "No Foods Available";

  @override
  String get newFood => "New Food";

  @override
  String get save => "Save";

  @override
  String get calories => "Calories";

  @override
  String get errorInsideTheForm => "Error Inside the Form";

  @override
  String get successfullySavedFood => "Successfully Saved Food";

  @override
  String get foodName => "Food Name";

  @override
  String get issueInName => "Issue In Name";

  @override
  String get enterFoodName => "Enter Food Name";

  @override
  String get enterCalories => "Enter Calories";

  @override
  String get issueInCalories => "Issue In Calories";
}
