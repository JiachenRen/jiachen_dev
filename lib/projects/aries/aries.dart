import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive5_web/assets.dart';
import 'package:hive5_web/components/buttons.dart';
import 'package:hive5_web/components/themed_flat_button.dart';
import 'package:hive5_web/home/home_page.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

import '../../effects/hive_background.dart';

class Aries extends StatelessWidget {
  static final route = p.join(Projects.route, 'aries');

  Aries({Key key}) : super(key: key);

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
                    Assets.ariesIcon,
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Aries: Origins',
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
                      Buttons.email,
                      ThemedFlatButton(
                        onPressed: () {
                          // Prefers GitHub to host downloadable content to reduce server load.
                          launch(
                              'https://github.com/JiachenRen/jiachen_dev/releases/download/v1.0/aries_v1.0.apk');
                          // launch('/downloads/aries_v1.0.apk');
                        },
                        icon: Ionicons.logo_android,
                        label: 'Android',
                      ),
                      ThemedFlatButton(
                        onPressed: () {
                          launch(
                              'https://apps.apple.com/us/app/aries-origins/id1549356851');
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
