import 'package:flutter/material.dart';

/// The screen that's shown when checking auth status
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          'assets/images/logo/vgc_transparent_white.png',
          height: 200,
        ),
      ),
    );
  }
}
