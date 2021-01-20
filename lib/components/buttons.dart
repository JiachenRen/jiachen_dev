import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive5_web/components/themed_flat_button.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Buttons {
  static final github = ThemedFlatButton(
    onPressed: () {
      launch('https://github.com/JiachenRen');
    },
    icon: Ionicons.logo_github,
    label: 'GitHub',
  );
  static final email = ThemedFlatButton(
    onPressed: () {
      launch('mailto:jiachenren.dev@gmail.com');
    },
    icon: Ionicons.ios_mail,
    label: 'Email',
  );
  static final linkedIn = ThemedFlatButton(
    onPressed: () {
      launch('https://www.linkedin.com/in/jiachen-ren-82188b161/');
    },
    icon: Ionicons.logo_linkedin,
    label: 'LinkedIn',
  );
}
