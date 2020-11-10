import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Very Good Chat',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Very Good Chat'),
        ),
        body: Container(),
      ),
    );
  }
}
