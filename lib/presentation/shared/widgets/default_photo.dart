import 'package:flutter/material.dart';

/// Default photo
class DefaultPhoto extends StatelessWidget {
  static const _assetName = 'assets/images/profile_photo.png';

  /// Provider for default photo
  static const provider = AssetImage(_assetName);

  @override
  Widget build(BuildContext context) {
    return Image.asset(_assetName);
  }
}
