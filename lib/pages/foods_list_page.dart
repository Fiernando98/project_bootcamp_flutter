import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_bootcamp_flutter/models/food.dart';
import 'package:project_bootcamp_flutter/pages/create_food_form_page.dart';
import 'package:project_bootcamp_flutter/translates/translates.dart';
import 'package:project_bootcamp_flutter/utilities/database/database_helper.dart';
import 'package:project_bootcamp_flutter/utilities/database/tables.dart';
import 'package:project_bootcamp_flutter/utilities/methods/public.dart';
import 'package:project_bootcamp_flutter/widgets_items/food_item.dart';
import 'package:sqflite/sqflite.dart';

class FoodsListPage extends StatefulWidget {
  @override
  _FoodsListPageState createState() => _FoodsListPageState();
}

class _FoodsListPageState extends State<FoodsListPage> {
  List<Food>? _list;

  AppBar _appBar() {
    return AppBar(title: Text("${Translates.of(context)!.foods}"));
  }

  Widget _body() {
    if (_list == null) {
      return Center(child: CircularProgressIndicator());
    }
    if (_list!.isEmpty)
      return Center(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Text("${Translates.of(context)!.noFoodsAvailable}",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey))));

    return ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(height: 0, thickness: 2),
        itemCount: _list!.length,
        itemBuilder: (context, index) {
          Food _food = _list![index];
          return FoodItem(
              name: _food.name ?? "", calories: _food.calories ?? 0.0);
        });
  }

  Widget _fabGoToForm() {
    return FloatingActionButton.extended(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateFoodFormPage()))
            .whenComplete(() => _readDataBase()),
        label: Text("${Translates.of(context)!.createFood}"),
        icon: Icon(Icons.add));
  }

  @override
  void initState() {
    _readDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(), body: _body(), floatingActionButton: _fabGoToForm());
  }

  void _readDataBase() async {
    try {
      final Database? db = await DataBaseHelper.db.database;
      List<dynamic>? results = await db!.query(DBTables().food);
      _list = results.map((result) => Food.fromMapSQL(result)).toList();
      setState(() {});
    } catch (error) {
      snackMesage(message: error.toString(), context: context, isError: true);
    }
  }
}
