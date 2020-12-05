import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:very_good_chat/presentation/shared/widgets/default_photo.dart';
import 'package:very_good_chat/presentation/shared/widgets/loading_photo_placeholder.dart';

/// Profile picture duh
class ProfilePicture extends StatelessWidget {
  /// Constructor
  const ProfilePicture({
    Key key,
    @required this.onPressed,
    @required this.photoUrl,
    this.isOnline = false,
    this.lastSeen,
    this.size = 150,
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

  /// The size of the widget
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        height: size,
        width: size,
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
                  : DefaultPhoto(),
            ),
            if (isOnline)
              const Positioned(
                bottom: 10,
                right: 10,
                child: OnlineDot(radius: 20),
              ),
            if (!isOnline && lastSeen != null)
              Positioned(
                bottom: 10,
                right: 10,
                child: LastSeenBadge(
                  lastSeen: lastSeen,
                  size: 14,
                ),
              ),
          ],
        ),
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
      padding: const EdgeInsets.all(4),
      child: Container(
        width: radius,
        height: radius,
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).primaryColor,
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.green.shade700.withOpacity(0.2),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 2,
        ),
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
