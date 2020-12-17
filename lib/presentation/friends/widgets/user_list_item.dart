import 'package:flutter/material.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// List item for friends list
class UserListItem extends StatelessWidget {
  /// Constructor
  const UserListItem({
    Key key,
    @required this.sc,
    @required this.user,
    this.isOnline = false,
    this.lastSeen,
    this.onPressed,
    this.onPhotoPressed,
    this.trailing,
  }) : super(key: key);

  /// The friend for this list item
  final User user;

  /// Is the user online
  final bool isOnline;

  /// Last time the user was online
  final DateTime lastSeen;

  /// Callback for when the item is pressed
  final void Function() onPressed;

  /// Callback for when the photo is pressed
  final void Function() onPhotoPressed;

  /// This item's trailing
  final Widget trailing;

  /// Size config data
  final SizeConfig sc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: ProfilePicture(
        onPressed: onPhotoPressed,
        photoUrl: user.photoUrl,
        isOnline: isOnline,
        lastSeen: lastSeen,
        radius: sc.width(10),
        onlineDotRadius: sc.width(3),
        lastSeenBadgeSize: sc.width(2.5),
      ),
      title: Text(
        user.name ?? user.username,
        style: TextStyle(fontSize: sc.width(4)),
      ),
      trailing: trailing,
      dense: true,
    );
  }
}
