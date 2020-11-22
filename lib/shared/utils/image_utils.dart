import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photo/photo.dart';
import 'package:very_good_chat/shared/router.gr.dart';

/// A class for picking/manipulating images
abstract class ImageUtils {
  /// Concrete implementation of [ImageUtils]
  static ImageUtils instance = _VeryGoodImageUtils();

  /// Display photos in a list/grid and let user pick one
  Future<Uint8List> pickImage(BuildContext context);

  /// Edit a picture
  Future<Uint8List> editImage({
    @required BuildContext context,
    @required Uint8List originalBytes,
    double cropRatio,
  });
}

class _VeryGoodImageUtils implements ImageUtils {
  @override
  Future<Uint8List> pickImage(BuildContext context) async {
    final assets = await PhotoPicker.pickAsset(
      context: context,
      rowCount: 3,
      maxSelected: 1,
      provider: I18nProvider.english,
      thumbSize: 128,
      pickType: PickType.onlyImage,
    );
    if (assets == null || assets.isEmpty) return null;
    final bytes = await assets.first.originBytes;
    return bytes;
  }

  @override
  Future<Uint8List> editImage({
    @required BuildContext context,
    @required Uint8List originalBytes,
    double cropRatio,
  }) async {
    final image = await ExtendedNavigator.of(context).push(
      Routes.imageCropper,
      arguments: ImageCropperArguments(
        imageBytes: originalBytes,
        cropRatio: cropRatio,
      ),
    ) as Uint8List;
    return image;
  }
}
