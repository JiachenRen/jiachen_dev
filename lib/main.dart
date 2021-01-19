import 'package:flutter/material.dart';
import 'package:hive5_web/app_theme.dart';
import 'package:hive5_web/home_page.dart';
import 'package:hive5_web/projects/hive5/hive5.dart';
import 'package:hive5_web/projects/projects.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: AppTheme.backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'NotoSans',
    );
    return MaterialApp(
      title: 'Hive: Origins',
      theme: theme.copyWith(
          textTheme: theme.textTheme.apply(
              bodyColor: AppTheme.foregroundColor, displayColor: AppTheme.foregroundColor)),
      routes: {
        HomePage.route: (context) => HomePage(),
        Projects.route: (context) => Projects(),
        Hive5.route: (context) => Hive5(),
      },
      initialRoute: HomePage.route,
    );
  }
}




