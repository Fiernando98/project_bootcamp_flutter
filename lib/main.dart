import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_bootcamp_flutter/pages/foods_list_page.dart';
import 'package:project_bootcamp_flutter/translates/app_localization_delegate.dart';
import 'package:project_bootcamp_flutter/translates/translates.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Foods App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales:
            languagesSupported.map((language) => Locale(language)),
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue[700],
            accentColor: Colors.red[900],
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Theme.of(context).primaryColor)),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.blue[700],
            accentColor: Colors.red[900],
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Theme.of(context).primaryColor)),
        home: FoodsListPage());
  }
}
