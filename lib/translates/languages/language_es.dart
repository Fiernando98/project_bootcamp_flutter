import 'package:project_bootcamp_flutter/translates/translates.dart';

class LanguageEs extends Translates {
  final String _code;

  LanguageEs(this._code);

  @override
  String get codeLanguage => _code;

  @override
  String get foods => "Alimentos";

  @override
  String get createFood => "Crear Alimento";

  @override
  String get noFoodsAvailable => "No Hay Alimentos Disponibles";

  @override
  String get newFood => "Alimento Nuevo";

  @override
  String get save => "Guardar";

  @override
  String get calories => "Calorías";
}
