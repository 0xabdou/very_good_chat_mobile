import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_editor/image_editor.dart';
import 'package:very_good_chat/shared/utils/dialog_utils.dart';

/// A screen that helps edit images
class ImageCropper extends StatefulWidget {
  /// Constructor
  const ImageCropper({
    Key key,
    @required Uint8List imageBytes,
    double cropRatio,
  })  : _imageBytes = imageBytes,
        _cropRatio = cropRatio,
        super(key: key);

  final Uint8List _imageBytes;
  final double _cropRatio;

  @override
  _ImageCropperState createState() => _ImageCropperState();
}

class _ImageCropperState extends State<ImageCropper> {
  final editorKey = GlobalKey<ExtendedImageEditorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => DialogUtils.instance.showYesNoDialog(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              final result =
                  await DialogUtils.instance.showYesNoDialog(context);
              if (result) Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
          ),
          title: const Text('Crop image'),
          actions: [
            IconButton(
              onPressed: () async {
                final image = await _getEditedImage();
                Navigator.of(context).pop(image);
              },
              icon: const Icon(Icons.check),
            ),
          ],
        ),
        body: ExtendedImage.memory(
          widget._imageBytes,
          extendedImageEditorKey: editorKey,
          fit: BoxFit.contain,
          mode: ExtendedImageMode.editor,
          initEditorConfigHandler: (state) {
            return EditorConfig(
              cropAspectRatio: widget._cropRatio,
            );
          },
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                if (index == 0) {
                  editorKey.currentState.rotate(right: false);
                } else if (index == 1) {
                  editorKey.currentState.rotate();
                } else if (index == 2) {
                  editorKey.currentState.flip();
                } else {
                  editorKey.currentState.reset();
                }
              });
            },
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.rotate_left),
                label: 'Rotate left',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rotate_right),
                label: 'Rotate right',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.flip),
                label: 'Flip',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Reset',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Uint8List> _getEditedImage() async {
    final action = editorKey.currentState.editAction;
    final rect = editorKey.currentState.getCropRect();
    final img = editorKey.currentState.rawImageData;

    final rotateAngle = action.rotateAngle.toInt();
    final flipHorizontal = action.flipY;
    final flipVertical = action.flipX;

    final option = ImageEditorOption();

    if (action.needCrop) option.addOption(ClipOption.fromRect(rect));

    if (action.needFlip) {
      option.addOption(
        FlipOption(
          horizontal: flipHorizontal,
          vertical: flipVertical,
        ),
      );
    }

    if (action.hasRotateAngle) option.addOption(RotateOption(rotateAngle));

    final bytes = await ImageEditor.editImage(
      image: img,
      imageEditorOption: option,
    );

    return bytes;
  }
}
