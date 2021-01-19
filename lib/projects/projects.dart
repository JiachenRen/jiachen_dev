import 'package:flutter/material.dart';
import 'package:hive5_web/projects/hive5/hive_background.dart';

class Projects extends StatelessWidget {
  static const route = '/projects';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiveBackground(
        child: Center(
          child: Text(
            'Projects',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
