import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/presentation/profile/widgets/friendship_menu.dart';

import '../widget_wrappers.dart';

void main() {
  AnimationController controller;
  setUpAll(() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: const TestVSync(),
    )..value = 1;
  });

  tearDownAll(() {
    controller.dispose();
  });

  Widget _getWidget(Relationship relationship) {
    return wrapInMaterialApp(FriendshipMenu(
      animation: controller,
      relationship: relationship,
    ));
  }

  testWidgets(
    'If the relationship is self, should contain Unfriend and Block buttons',
    (tester) async {
      final widget = _getWidget(const Relationship.self());
      await tester.pumpWidget(widget);
      expect(find.byIcon(Icons.person_remove), findsOneWidget);
      expect(find.byIcon(FontAwesomeIcons.ban), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(2));
    },
  );
}
