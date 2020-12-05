import 'package:flutter/material.dart';
import 'package:very_good_chat/shared/size_config.dart';

Widget wrapInSizeConfig(Widget widget) {
  return Builder(
    builder: (context) {
      return SizeConfig(
        data: SizeConfigData.fromContext(context),
        child: widget,
      );
    },
  );
}

Widget wrapInMaterialApp(Widget widget) {
  return MaterialApp(home: Scaffold(body: widget));
}

Widget wrapInMaterialSizeConfigApp(widget) {
  return wrapInMaterialApp(wrapInSizeConfig(widget));
}
