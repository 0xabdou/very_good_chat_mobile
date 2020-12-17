import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:very_good_chat/presentation/shared/widgets/default_photo.dart';
import 'package:very_good_chat/presentation/shared/widgets/loading_photo_placeholder.dart';

/// Used by hero widgets
const kTagProfilePhoto = 'profilePhoto';

/// Profile picture duh
class ProfilePicture extends StatelessWidget {
  /// Constructor
  const ProfilePicture({
    Key key,
    @required this.onPressed,
    @required this.photoUrl,
    this.isOnline = false,
    this.lastSeen,
    this.radius = 150,
    this.onlineDotRadius,
    this.lastSeenBadgeSize,
    this.dotAlignment = Alignment.bottomRight,
    this.badgeAlignment = Alignment.bottomRight,
  }) : super(key: key);

  /// The photo url
  final String photoUrl;

  /// On pressed callback
  final void Function() onPressed;

  /// If true, display the green dot in the photo
  final bool isOnline;

  /// If [isOnline] is false, and this is not null, may display a duration
  /// instead of the green dot, representing how long the user has been offline
  final DateTime lastSeen;

  /// The radius of the widget
  final double radius;

  /// The radius of the green dot
  final double onlineDotRadius;

  /// The size of the last seen badge
  final double lastSeenBadgeSize;

  /// Online dot alignment
  final Alignment dotAlignment;

  /// Last seen badge alignment
  final Alignment badgeAlignment;

  @override
  Widget build(BuildContext context) {
    final dotRadius = onlineDotRadius ?? radius / 7;
    final badgeSize = lastSeenBadgeSize ?? radius / 10;
    return SizedBox(
      height: radius,
      width: radius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Material(
            clipBehavior: Clip.antiAlias,
            shape: const CircleBorder(),
            child: photoUrl != null
                ? CachedNetworkImage(
                    imageUrl: photoUrl, //photoUrl,
                    imageBuilder: (context, imageProvider) {
                      return Ink.image(
                        image: imageProvider,
                        child: InkWell(
                          onTap: onPressed,
                        ),
                      );
                    },
                    placeholder: (_, __) => LoadingPhotoPlaceholder(),
                  )
                : Ink.image(
                    image: DefaultPhoto.provider,
                    child: InkWell(
                      onTap: onPressed,
                    ),
                  ),
          ),
          if (isOnline)
            Positioned.fill(
              child: Align(
                alignment: dotAlignment,
                child: OnlineDot(radius: dotRadius),
              ),
            ),
          if (!isOnline && lastSeen != null)
            Positioned.fill(
              child: Align(
                alignment: badgeAlignment,
                child: LastSeenBadge(
                  lastSeen: lastSeen,
                  size: badgeSize,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// The green dot that appears on profile photos if the user is online
class OnlineDot extends StatelessWidget {
  /// Constructor
  const OnlineDot({
    Key key,
    @required this.radius,
  }) : super(key: key);

  /// The dot's radius
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: EdgeInsets.all(radius / 10),
      child: Container(
        width: radius - radius / 10,
        height: radius - radius / 10,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

/// To display how long was the user offline
class LastSeenBadge extends StatelessWidget {
  /// Constructor
  const LastSeenBadge({
    Key key,
    @required this.lastSeen,
    @required this.size,
  }) : super(key: key);

  /// The time when the user was last seen
  final DateTime lastSeen;

  /// the size
  final double size;

  @override
  Widget build(BuildContext context) {
    final duration = _duration;
    if (duration == null) return Container();
    return Material(
      borderRadius: BorderRadius.circular(size),
      color: Theme.of(context).primaryColor,
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: Colors.green.shade700.withOpacity(0.2),
        ),
        padding: EdgeInsets.symmetric(horizontal: size / 2),
        margin: EdgeInsets.all(size / 10),
        child: Text(
          duration,
          style: TextStyle(
            color: Colors.green,
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String get _duration {
    if (lastSeen == null) return null;
    final now = DateTime.now().millisecondsSinceEpoch;
    final then = lastSeen.millisecondsSinceEpoch;
    final diff = now - then;
    if (diff == 0) return '0m';
    final minutes = diff ~/ 60000;
    if (minutes < 60) return '${minutes}m';
    final hours = minutes ~/ 60;
    if (hours < 24) return '${hours}h';
    if (hours < 48) return '1d';
    return null;
  }
}
