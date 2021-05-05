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
}
