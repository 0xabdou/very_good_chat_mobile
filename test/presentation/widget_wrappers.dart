import 'package:flutter/material.dart';

Widget wrapInMaterial(Widget widget) => Material(child: widget);

Widget wrapInDirectionality(Widget widget) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: widget,
  );
}

Widget wrapInScaffold(Widget widget) => Scaffold(body: widget);

Widget wrapInMaterialApp(Widget widget) {
  return MaterialApp(home: widget);
}

Widget wrapInScaffoldMaterialApp(Widget widget) {
  return wrapInMaterialApp(wrapInScaffold(widget));
}
