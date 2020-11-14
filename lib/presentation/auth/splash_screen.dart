import 'package:flutter/material.dart';

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
