import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive5_web/assets.dart';
import 'package:hive5_web/components/buttons.dart';
import 'package:hive5_web/components/image_gallery.dart';
import 'package:hive5_web/components/themed_flat_button.dart';
import 'package:hive5_web/projects/hive5/hive_background.dart';
import 'package:url_launcher/url_launcher.dart';

part 'projects.dart';

part 'about_me.dart';

part 'music.dart';

class HomePage extends StatefulWidget {
  static const route = '/';
  final int tabIndex;

  const HomePage({Key key, this.tabIndex = 0}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<_TabMixin> _tabs = [
    AboutMe(),
    Projects(),
    Music(),
  ];

  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: _tabs.length, vsync: this);
    Future.microtask(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 7),
          content: Text(
              'Website built with Flutter web beta. For best performance, please open in Chrome.')));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HiveBackground(
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: TabBar(
                  controller: _controller,
                  tabs: _tabs.map((e) => Text(e.name)).toList()),
            ),
            Expanded(
              child: TabBarView(
                children: _tabs,
                controller: _controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin _TabMixin on Widget {
  String get name;
}
