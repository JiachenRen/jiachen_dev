import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive5_web/app_theme.dart';


class ThemedFlatButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const ThemedFlatButton(
      {Key key,
        @required this.label,
        @required this.icon,
        @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: AppTheme.foregroundColor,
      ),
      label: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: AppTheme.foregroundColor),
      ),
    );
  }
}