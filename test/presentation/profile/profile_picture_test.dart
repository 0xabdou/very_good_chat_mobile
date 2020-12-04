import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';
import 'package:very_good_chat/presentation/shared/widgets/default_photo.dart';

void main() {
  Widget _getWidget({String url, bool isOnline = false, DateTime lastSeen}) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ProfilePicture(
        onPressed: () {},
        photoUrl: url,
        isOnline: isOnline,
        lastSeen: lastSeen,
      ),
    );
  }

  testWidgets('If photoUrl is null, display the default photo', (tester) async {
    // arrange
    final widget = _getWidget();
    // render
    await tester.pumpWidget(widget);
    // assert
    expect(find.byType(CachedNetworkImage), findsNothing);
    expect(find.byType(DefaultPhoto), findsOneWidget);
  });

  testWidgets(
    'If photoUrl is not null, display a cached network image',
    (tester) async {
      // arrange
      final widget = _getWidget(url: 'www.picsum.com/200');
      // render
      await tester.pumpWidget(widget);
      // assert
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(DefaultPhoto), findsNothing);
    },
  );

  testWidgets(
    'If isOnline is true, display a green dot',
    (tester) async {
      // arrange
      final widget = _getWidget(isOnline: true);
      // render
      await tester.pumpWidget(widget);
      // assert
      expect(find.byType(OnlineDot), findsOneWidget);
    },
  );

  testWidgets(
    'If lastSeen is set and isOnline is false, display a last seen badge',
    (tester) async {
      // arrange
      final widget = _getWidget(lastSeen: DateTime.now());
      // render
      await tester.pumpWidget(widget);
      // assert
      expect(find.byType(LastSeenBadge), findsOneWidget);
    },
  );
}
