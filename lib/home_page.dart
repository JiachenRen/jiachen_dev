import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive5_web/projects/hive5/hive_background.dart';

class HomePage extends StatelessWidget {
  static const route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiveBackground(
        child: Center(
          child: Text(
            'Jiachen Ren',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
