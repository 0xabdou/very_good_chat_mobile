import 'package:flutter/material.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({
    Key key,
    @required this.title,
    @required this.content,
    @required this.yesText,
    @required this.noText,
  }) : super(key: key);

  final String title;
  final String content;
  final String yesText;
  final String noText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(yesText),
        ),
        FlatButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(noText),
        ),
      ],
    );
  }
}

Future<bool> yesNoDialog(
  BuildContext context, {
  String title = 'Cancel',
  String content = 'Are you sure you want to cancel?',
  String yesText = 'Yes',
  String noText = 'No',
}) async {
  final result = await showDialog(
    context: context,
    builder: (_) => YesNoDialog(
      title: title,
      content: content,
      yesText: yesText,
      noText: noText,
    ),
  ) as bool;
  return result;
}
