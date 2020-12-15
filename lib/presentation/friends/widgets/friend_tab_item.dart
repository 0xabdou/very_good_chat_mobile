import 'package:flutter/material.dart';

/// Tab bar item for friends screen
class FriendsTabItem extends StatelessWidget {
  /// Constructor
  const FriendsTabItem({
    Key key,
    @required this.onTap,
    @required this.text,
    @required this.active,
  }) : super(key: key);

  /// Callback for when this item is clicked
  final void Function() onTap;

  /// The text to display
  final String text;

  /// True if this item is active
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? Colors.grey.shade900 : Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
