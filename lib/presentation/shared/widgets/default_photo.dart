import 'package:flutter/material.dart';

/// Default photo
class DefaultPhoto extends StatelessWidget {
  /// Constructor
  const DefaultPhoto({Key key, this.onPressed}) : super(key: key);

  static const _assetName = 'assets/images/profile_photo.png';

  /// Provider for default photo
  static const provider = AssetImage(_assetName);

  /// onPressed callback
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: provider,
      child: InkWell(
        onTap: onPressed,
      ),
    );
  }
}
