import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/presentation/shared/widgets/loading_photo_placeholder.dart';
import 'package:very_good_chat/shared/size_config.dart';

/// Display images in fullscreen with ability to zoom
class FullImage extends StatelessWidget {
  /// Constructor
  const FullImage({
    Key key,
    this.imageUrl,
    this.provider,
    this.tag,
  })  : assert(imageUrl != null || provider != null),
        super(key: key);

  /// The image url
  final String imageUrl;

  /// The image provider
  final ImageProvider provider;

  /// The hero widget tag
  final String tag;

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context);
    final tag = this.tag ?? kTagProfilePhoto;
    return Container(
      color: Colors.black,
      width: sc.width(100),
      height: sc.height(100),
      child: Hero(
        tag: tag,
        child: Center(
          child: imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: sc.width(100),
                  height: sc.height(100),
                  imageBuilder: (context, image) {
                    return ExtendedImage(
                      image: image,
                      mode: ExtendedImageMode.gesture,
                    );
                  },
                  placeholder: (_, __) => LoadingPhotoPlaceholder(),
                )
              : Image(image: provider),
        ),
      ),
    );
  }
}
