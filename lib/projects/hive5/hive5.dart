import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive5_web/app_theme.dart';
import 'package:hive5_web/projects/projects.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

import 'hive_background.dart';

class Hive5 extends StatelessWidget {
  static final route = p.join(Projects.route, 'hive5');

  Hive5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiveBackground(
        child: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    'images/app_icon.jpg',
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Hive: Origins',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Designed by Jiachen Ren, Copyright® 2021',
                  style: Theme.of(context).textTheme.overline,
                ),
                SizedBox(
                  height: 16,
                ),
                IntrinsicWidth(
                  child: Row(
                    children: [
                      _Button(
                        onPressed: () {
                          launch('mailto:jiachenren.dev@gmail.com');
                        },
                        icon: Ionicons.ios_mail,
                        label: 'Email',
                      ),
                      _Button(
                        onPressed: () {
                          launch('https://github.com/JiachenRen');
                        },
                        icon: Ionicons.logo_github,
                        label: 'GitHub',
                      ),
                      _Button(
                        onPressed: () {
                          launch(
                              'https://apps.apple.com/us/app/hive-origins/id1549356851');
                        },
                        icon: Ionicons.ios_appstore,
                        label: 'App Store',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _Button(
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
