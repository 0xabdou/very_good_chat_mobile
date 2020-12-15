import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

/// A utility class for dialogs
abstract class DialogUtils {
  /// An implementation of [DialogUtils]
  static DialogUtils instance = _GoodDialogUtils();

  /// Show a dialog to confirm some action
  Future<bool> showYesNoDialog(
    BuildContext context, {
    String title,
    String content,
    String yesText,
    String noText,
  });
}

class _GoodDialogUtils implements DialogUtils {
  @override
  Future<bool> showYesNoDialog(
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
    return result ?? false;
  }
}

/// A simple yes/no dialog widget
class YesNoDialog extends StatelessWidget {
  /// Constructor
  const YesNoDialog({
    Key key,
    @required this.title,
    @required this.content,
    @required this.yesText,
    @required this.noText,
  }) : super(key: key);

  /// Dialog's title
  final String title;

  /// Dialog's content
  final String content;

  /// Dialog's 'yes button' text
  final String yesText;

  /// Dialog's 'no button' text
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

/// Show an error snack bar with the provided error message
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
