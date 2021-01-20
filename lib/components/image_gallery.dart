import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class ImageGallery extends StatefulWidget {
  final double size;

  /// Duration to wait before displaying next image.
  final Duration duration;

  final Duration transitionDuration;

  /// Asset image paths
  final List<String> images;

  const ImageGallery({
    Key key,
    this.duration = const Duration(seconds: 10),
    this.transitionDuration = const Duration(milliseconds: 300),
    @required this.size,
    @required this.images,
  }) : super(key: key);

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery>
    with SingleTickerProviderStateMixin {
  static Random rand = Random();

  List<String> get _images => widget.images;
  AnimationController _controller;
  int _idx = 0;
  Timer _timer;
  Widget _child;
  Animation<double> _tiltCenterLeft;
  Animation<double> _tiltLeftCenter;
  Animation<double> _tiltCenterRight;
  Animation<double> _tiltRightCenter;

  @override
  void initState() {
    bool b = rand.nextBool();
    final duration = b ? Duration(seconds: 5) : Duration(seconds: 5);
    _controller =
        AnimationController(vsync: this, duration: duration);
    Curve inCurve = b ? Curves.easeIn : Curves.elasticIn;
    Curve outCurve = b ? Curves.easeOut : Curves.elasticOut;
    double turns = 0.025;
    _tiltCenterLeft =
        Tween<double>(begin: 0, end: -turns).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.25, curve: inCurve),
    ));
    _tiltLeftCenter =
        Tween<double>(begin: -turns, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.25, 0.5, curve: outCurve),
    ));
    _tiltCenterRight =
        Tween<double>(begin: 0, end: turns).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 0.75, curve: inCurve),
    ));
    _tiltRightCenter =
        Tween<double>(begin: turns, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.75, 1, curve: outCurve),
    ));
    _controller.repeat(reverse: false);
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _idx += 1;
        _idx %= _images.length;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _child = Image.asset(
      _images[_idx],
      width: widget.size,
      height: widget.size,
      key: ValueKey(_idx),
    );
    return RotationTransition(
      turns: _tiltCenterLeft,
      child: RotationTransition(
        turns: _tiltLeftCenter,
        child: RotationTransition(
          turns: _tiltCenterRight,
          child: RotationTransition(
            turns: _tiltRightCenter,
            child: AnimatedSwitcher(
              duration: widget.transitionDuration,
              child: _child,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
