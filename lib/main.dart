import 'package:flutter/material.dart';
import 'package:hive5_web/app_theme.dart';
import 'package:hive5_web/home/home_page.dart';
import 'package:hive5_web/projects/hive5/hive5.dart';

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
      dialogBackgroundColor: AppTheme.backgroundColor,
      tabBarTheme: TabBarTheme(
        labelColor: AppTheme.foregroundColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 2, color: AppTheme.foregroundColor),
        ),
      ),
    );
    return MaterialApp(
      title: "Jiachen Ren",
      theme: theme.copyWith(
        textTheme: theme.textTheme.apply(
          bodyColor: AppTheme.foregroundColor,
          displayColor: AppTheme.foregroundColor,
        ),
      ),
      routes: {
        HomePage.route: (context) => HomePage(),
        Projects.route: (context) => HomePage(tabIndex: 1),
        Hive5.route: (context) => Hive5(),
      },
      initialRoute: HomePage.route,
    );
  }
}
