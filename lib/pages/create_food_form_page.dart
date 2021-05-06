import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_bootcamp_flutter/models/food.dart';
import 'package:project_bootcamp_flutter/translates/translates.dart';
import 'package:project_bootcamp_flutter/utilities/database/database_helper.dart';
import 'package:project_bootcamp_flutter/utilities/database/tables.dart';
import 'package:project_bootcamp_flutter/utilities/methods/public.dart';
import 'package:sqflite/sqflite.dart';

class CreateFoodFormPage extends StatefulWidget {
  @override
  _CreateFoodFormPageState createState() => _CreateFoodFormPageState();
}

class _CreateFoodFormPageState extends State<CreateFoodFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name = "";
  String _calories = "";

  AppBar _appBar() {
    return AppBar(title: Text("${Translates.of(context)!.newFood}"));
  }

  Widget _fabSave() {
    return FloatingActionButton.extended(
        onPressed: _saveFood,
        label: Text("${Translates.of(context)!.save}"),
        icon: Icon(Icons.save));
  }

  Widget _inputFood() {
    return Container(
        child: TextFormField(
            keyboardType: TextInputType.name,
            style: TextStyle(fontWeight: FontWeight.bold),
            onSaved: (val) => _name = val ?? "",
            validator: (val) => (val!.isNotEmpty)
                ? null
                : "${Translates.of(context)!.issueInName}",
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.fastfood),
                labelText: "${Translates.of(context)!.foodName}",
                hintText: "${Translates.of(context)!.enterFoodName}")));
  }

  Widget _inputCalories() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: TextFormField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(fontWeight: FontWeight.bold),
            onSaved: (val) => _calories = val ?? "",
            validator: (val) => (val!.isNotEmpty)
                ? null
                : "${Translates.of(context)!.issueInCalories}",
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.countertops),
                labelText: "${Translates.of(context)!.calories}",
                hintText: "${Translates.of(context)!.enterCalories}")));
  }

  Widget _formPage() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _formKey,
            child: Column(children: [_inputFood(), _inputCalories()])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(), body: _formPage(), floatingActionButton: _fabSave());
  }

  void _saveFood() async {
    final FormState? _formState = _formKey.currentState;
    if (_formState != null && _formState.validate()) {
      _formState.save();
      try {
        Food _food = Food(
            id: null,
            idServer: null,
            name: _name,
            calories: double.tryParse(_calories));
        await _insertDatabase(_food);
        snackMesage(
            message: "${Translates.of(context)!.successfullySavedFood}",
            context: context);
        Navigator.of(context).pop();
      } catch (error) {
        snackMesage(
            message: "${error.toString()}", context: context, isError: true);
      }
    } else {
      snackMesage(
          message: "${Translates.of(context)!.errorInsideTheForm}",
          context: context,
          isError: true);
    }
  }

  Future<void> _insertDatabase(Food food) async {
    final Database? db = await DataBaseHelper.db.database;
    await db!.insert(DBTables().food, food.toMapSQL());
  }
}
