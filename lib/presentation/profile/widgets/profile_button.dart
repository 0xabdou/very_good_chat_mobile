import 'package:flutter/material.dart';

/// The buttons that appears in a profile page
class ProfileButton extends StatelessWidget {
  /// Constructor
  const ProfileButton({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.label,
    this.color = Colors.white,
  }) : super(key: key);

  /// on pressed callback
  final void Function() onPressed;

  /// Widget to show as icon
  final Widget icon;

  /// Text under icon
  final String label;

  /// Color of text and icon
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
          color: color,
        ),
        Text(label),
      ],
    );
  }
}
