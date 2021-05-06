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

  @override
  String get errorInsideTheForm => "Error Dentro del Formulario";

  @override
  String get successfullySavedFood => "Alimento Guardado Exitosamente";

  @override
  String get foodName => "Nombre de Alimento";

  @override
  String get issueInName => "Error en Nombre de Alimento";

  @override
  String get enterFoodName => "Introduce Nombre de Alimento";

  @override
  String get enterCalories => "Introduce Calorías";

  @override
  String get issueInCalories => "Error en Calorías";
}
