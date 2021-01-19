import 'dart:math';

import 'package:flutter/cupertino.dart';

/// Breathe effect
class Breathe extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double start;
  final double minScale;
  final double maxScale;
  final double minOpacity;
  final double maxOpacity;

  /// If [start] is null, randomize start value.
  const Breathe({
    Key key,
    @required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.start = 0.0,
    this.minScale = 0.9,
    this.maxScale = 1,
    this.minOpacity = 0.2,
    this.maxOpacity = 1.0,
  }) : super(key: key);

  @override
  _BreatheState createState() => _BreatheState();
}

class _BreatheState extends State<Breathe> with SingleTickerProviderStateMixin {
  static final _random = Random();
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _opacityAnimation;

  @override
  void initState() {
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.value = widget.start ?? _random.nextDouble();
    var curved = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut);
    _scaleAnimation =
        Tween(begin: widget.minScale, end: widget.maxScale).animate(curved);
    _opacityAnimation =
        Tween(begin: widget.minOpacity, end: widget.maxOpacity).animate(curved);
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
