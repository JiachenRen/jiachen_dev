import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive5_web/assets.dart';
import 'package:hive5_web/effects/breathe.dart';

class HiveBackground extends StatefulWidget {
  /// Controls spatial density of hexagons.
  final int gridDensity;

  /// Max radius of hexagons
  final double maxRadius;

  /// Multiplied together with [radius] to get the actual padding.
  final double paddingRatio;

  /// Chance of a node spawning at each coordinate
  final double spawnRate;

  final double baseOpacity;

  final double variableOpacity;

  final Widget child;

  const HiveBackground({
    Key key,
    this.gridDensity = 8,
    this.maxRadius = 90.0,
    this.paddingRatio = 0.05,
    this.baseOpacity = 0.2,
    this.spawnRate = 0.5,
    this.variableOpacity = 0.1,
    this.child,
  }) : super(key: key);

  factory HiveBackground.unobtrusive({Widget child}) {
    return HiveBackground(
      baseOpacity: 0.1,
      variableOpacity: 0,
      child: child,
    );
  }

  @override
  _HiveBackgroundState createState() => _HiveBackgroundState();
}

class _HiveBackgroundState extends State<HiveBackground>
    with TickerProviderStateMixin {
  static final rand = Random();

  static const _colors = [
    Colors.deepOrange,
    Colors.orange,
    Colors.yellow,
    Colors.indigo,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.red,
  ];

  double _radius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      List<Widget> children = [];
      var w = constraints.maxWidth;
      var h = constraints.maxHeight;
      _radius = min(min(w, h) / widget.gridDensity, widget.maxRadius);
      var ix = -_radius * 3;
      var iy = -_radius * sin(pi / 3) * 2;
      children.addAll(_genNodes(w, h, ix, iy));
      children.addAll(
          _genNodes(w, h, ix + _radius * 1.5, iy + _radius * sin(pi / 3)));
      return Stack(children: [
        ...children,
        if (widget.child != null) Positioned.fill(child: widget.child),
      ]);
    });
  }

  Iterable<Widget> _genNodes(double w, double h, double ix, double iy) sync* {
    var y = iy;
    while (y < h) {
      var x = ix;
      while (x < w) {
        if (rand.nextDouble() < widget.spawnRate) {
          final color = _colors[rand.nextInt(_colors.length)].withOpacity(
              rand.nextDouble() * widget.variableOpacity + widget.baseOpacity);
          Widget child = Padding(
            padding: EdgeInsets.all(_radius * widget.paddingRatio),
            child: Image.asset(
              rand.nextBool() ? Assets.hexagonOutlined : Assets.hexagonFilled,
              color: color,
            ),
          );
          child = Breathe(
            start: null,
            minOpacity: 0,
            duration: Duration(milliseconds: rand.nextInt(1000) + 2000),
            child: child,
          );
          yield Positioned(
            left: x,
            top: y,
            width: _radius * 2,
            height: _radius * 2,
            child: child,
          );
        }
        x += _radius * 3;
      }
      y += _radius * sin(pi / 3) * 2;
    }
  }
}
