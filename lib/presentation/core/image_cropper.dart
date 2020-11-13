import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_editor/image_editor.dart';

class ImageCropper extends StatefulWidget {
  const ImageCropper({
    Key key,
    @required this.image,
  }) : super(key: key);

  final File image;

  @override
  _ImageCropperState createState() => _ImageCropperState();
}

class _ImageCropperState extends State<ImageCropper> {
  final editorKey = GlobalKey<ExtendedImageEditorState>();
  File image;

  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.clear),
        ),
        title: Text('Crop image'),
        actions: [
          IconButton(
            onPressed: () async {
              final x = await crop();
              Navigator.of(context).pop(x);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: ExtendedImage.file(
        image,
        extendedImageEditorKey: editorKey,
        fit: BoxFit.contain,
        mode: ExtendedImageMode.editor,
        initEditorConfigHandler: (state) {
          return EditorConfig(
            maxScale: 8.0,
            cropRectPadding: EdgeInsets.all(20.0),
            hitTestSize: 20.0,
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
    );
  }

  Future<Uint8List> crop() async {
    final action = editorKey.currentState.editAction;
    final rect = editorKey.currentState.getCropRect();
    final img = editorKey.currentState.rawImageData;

    final rotateAngle = action.rotateAngle.toInt();
    final flipHorizontal = action.flipY;
    final flipVertical = action.flipX;

    ImageEditorOption option = ImageEditorOption();

    if (action.needCrop) option.addOption(ClipOption.fromRect(rect));

    if (action.needFlip)
      option.addOption(
          FlipOption(horizontal: flipHorizontal, vertical: flipVertical));

    if (action.hasRotateAngle) option.addOption(RotateOption(rotateAngle));

    final bytes = await ImageEditor.editImage(
      image: img,
      imageEditorOption: option,
    );

    return Uint8List.fromList(bytes);
  }
}
