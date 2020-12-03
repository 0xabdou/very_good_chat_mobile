import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Profile picture duh
class ProfilePicture extends StatelessWidget {
  /// Constructor
  const ProfilePicture({
    Key key,
    @required this.photoUrl,
    @required this.onPressed,
    this.isOnline = false,
    this.lastSeen,
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

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 150,
        width: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Material(
              clipBehavior: Clip.antiAlias,
              shape: const CircleBorder(),
              child: CachedNetworkImage(
                imageUrl: photoUrl,
                imageBuilder: (context, imageProvider) {
                  return Ink.image(
                    image: imageProvider,
                    child: InkWell(
                      onTap: onPressed,
                    ),
                  );
                },
              ),
            ),
            if (isOnline)
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
