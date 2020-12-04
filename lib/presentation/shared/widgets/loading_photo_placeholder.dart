import 'package:flutter/material.dart';

/// A place holder to display when loading photos
class LoadingPhotoPlaceholder extends StatefulWidget {
  @override
  _LoadingPhotoPlaceholderState createState() =>
      _LoadingPhotoPlaceholderState();
}

class _LoadingPhotoPlaceholderState extends State<LoadingPhotoPlaceholder>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          _controller.reverse();
        else if (status == AnimationStatus.dismissed) _controller.forward();
      })
      ..forward();
    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _animation = ColorTween(
      begin: Colors.white.withOpacity(0),
      end: Colors.white.withOpacity(0.2),
    ).animate(curve);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Container(
          color: _animation.value,
        );
      },
    );
  }
}
