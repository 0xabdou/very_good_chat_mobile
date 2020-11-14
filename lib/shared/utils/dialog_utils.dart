import 'package:flushbar/flushbar.dart';
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

class ErrorSnackBar extends StatefulWidget {
  const ErrorSnackBar({
    Key key,
    @required this.errorMsg,
  }) : super(key: key);

  final String errorMsg;

  @override
  _ErrorSnackBarState createState() => _ErrorSnackBarState();
}

class _ErrorSnackBarState extends State<ErrorSnackBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return FractionalTranslation(
          translation: Offset(0, -_controller.value),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.errorMsg,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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

void showErrorSnackBar(BuildContext context, String errorMsg) {
  Flushbar(
    message: errorMsg,
    icon: const Icon(
      Icons.error_outline,
      color: Colors.white,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    isDismissible: false,
    duration: const Duration(seconds: 3),
    shouldIconPulse: false,
    backgroundColor: Colors.red,
    borderRadius: 10,
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
  ).show(context);
}
