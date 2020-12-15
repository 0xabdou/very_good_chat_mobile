import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/domain/auth/user.dart';
import 'package:very_good_chat/presentation/profile/profile.dart';
import 'package:very_good_chat/presentation/profile/widgets/friendship_menu.dart';
import 'package:very_good_chat/presentation/profile/widgets/profile_picture.dart';

import '../widget_wrappers.dart';

class MockProfileCubit extends Mock implements ProfileCubit {}

void main() {
  const user = User(id: 'id', username: 'username', name: 'name');
  ProfileCubit mockCubit;

  setUp(() {
    mockCubit = MockProfileCubit();
  });

  Widget _getWidget() {
    return BlocProvider<ProfileCubit>(
      create: (_) => mockCubit,
      child: wrapInMaterialApp(wrapInMaterial(Profile())),
    );
  }

  void _shouldContainBaseWidgets(User user) {
    testWidgets(
      'should contain all base widgets',
      (tester) async {
        // arrange
        final widget = _getWidget();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(ProfilePicture), findsOneWidget);
        expect(find.text('@${user.username}'), findsOneWidget);
        expect(find.text(user.name), findsOneWidget);
      },
    );
  }

  Finder messagingButtonFinder() => find.byIcon(FontAwesomeIcons.feather);

  group('User is viewing his own profile', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: user,
        relationship: Relationship.self(),
      ));
    });

    _shouldContainBaseWidgets(user);

    testWidgets(
      'should contain relationship a friendship and messaging buttons',
      (tester) async {
        // arrange
        final widget = _getWidget();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byIcon(FontAwesomeIcons.userCheck), findsOneWidget);
        expect(messagingButtonFinder(), findsOneWidget);
      },
    );

    testWidgets(
      'Should show the friendship menu if the friendship button is clicked',
      (tester) async {
        // arrange
        final widget = _getWidget();
        // render
        await tester.pumpWidget(widget);
        // assert that the menu is not visible
        expect(find.byType(FriendshipMenu), findsNothing);
        // click the button
        await tester.tap(find.byIcon(FontAwesomeIcons.userCheck));
        // rebuild
        await tester.pumpAndSettle();
        // assert that the menu is visible
        expect(find.byType(FriendshipMenu), findsOneWidget);
      },
    );
  });

  group('User is viewing a profile of someone he sent a friend request to', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: user,
        relationship: Relationship.requestSent(),
      ));
    });

    Finder friendshipButtonFinder() => find.byIcon(FontAwesomeIcons.userClock);

    _shouldContainBaseWidgets(user);

    testWidgets(
      'should contain a friendship button and no messaging one',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(friendshipButtonFinder(), findsOneWidget);
        expect(messagingButtonFinder(), findsNothing);
      },
    );

    testWidgets(
      'Clicking on the friendship button should show the friendship menu ',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        await tester.tap(friendshipButtonFinder());
        await tester.pumpAndSettle();
        expect(find.byType(FriendshipMenu), findsOneWidget);
      },
    );
  });

  group('User is viewing a stranger profile', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: user,
        relationship: Relationship.stranger(),
      ));
    });

    Finder friendshipButtonFinder() => find.byIcon(Icons.person_add);

    _shouldContainBaseWidgets(user);

    testWidgets(
      'should contain a friendship button and no messaging button',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(friendshipButtonFinder(), findsOneWidget);
        expect(messagingButtonFinder(), findsNothing);
      },
    );

    testWidgets(
      'Clicking on the friendship button should call cubit.sendFriendRequest()',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        await tester.tap(friendshipButtonFinder());
        verify(mockCubit.sendFriendRequest(any)).called(1);
      },
    );
  });
}
