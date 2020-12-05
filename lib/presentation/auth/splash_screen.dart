import 'package:flutter/material.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// The screen that's shown when checking auth status
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig.of(context);
    return Material(
      child: Center(
        child: Image.asset(
          'assets/images/logo/vgc_transparent_white.png',
          width: sc.width(80),
        ),
      ),
    );
  }
}
