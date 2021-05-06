import 'package:flutter/material.dart';
import 'package:project_bootcamp_flutter/translates/translates.dart';

class FoodItem extends StatelessWidget {
  final String name;
  final double calories;
  final bool onServer;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapSync;

  FoodItem(
      {required this.name,
      required this.calories,
      this.onServer = false,
      this.onTap,
      this.onTapSync});

  Widget _iconStatus() {
    return Icon((onServer) ? Icons.cloud : Icons.sd_storage);
  }

  Widget _txtName() {
    return Text("$name",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
  }

  Widget _txtCalories(BuildContext context) {
    return Text("${Translates.of(context)!.calories}: $calories",
        style: TextStyle(fontSize: 14));
  }

  Widget _textsContent(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_txtName(), _txtCalories(context)]);
  }

  Widget _btnSync() {
    if (onTapSync == null) return Container();
    return IconButton(onPressed: onTapSync, icon: Icon(Icons.cloud_upload));
  }

  Widget _itemBody(BuildContext context) {
    return Row(children: [
      Padding(padding: EdgeInsets.all(15), child: _iconStatus()),
      Expanded(child: _textsContent(context)),
      _btnSync()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: InkWell(
            onTap: onTap,
            child: Padding(
                padding: EdgeInsets.all(0), child: _itemBody(context))));
  }
}
