import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/profile/profile_cubit.dart';
import 'package:very_good_chat/application/profile/relationship.dart';
import 'package:very_good_chat/domain/friends/friend_failure.dart';
import 'package:very_good_chat/presentation/profile/widgets/friendship_menu.dart';

import '../../mock/mock_data.dart';
import '../widget_wrappers.dart';

class MockProfileCubit extends MockBloc implements ProfileCubit {}

void main() {
  const messageKey = ValueKey('friendship_menu_message');
  AnimationController controller;
  MockProfileCubit mockCubit;
  setUpAll(() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: const TestVSync(),
    )..value = 1;
  });

  tearDownAll(() {
    controller.dispose();
  });

  setUp(() {
    mockCubit = MockProfileCubit();
  });

  Widget _getWidget() {
    return wrapInMaterialApp(
      BlocProvider<ProfileCubit>(
        create: (_) => mockCubit,
        child: FriendshipMenu(
          animation: controller,
        ),
      ),
    );
  }

  group('Showing a message/spinner', () {
    // These tests could be improved
    testWidgets(
      'Should contain a message and not a spinner if the relationship is self',
      (tester) async {
        when(mockCubit.state).thenReturn(const ProfileState(
          initialized: true,
          user: user,
          relationship: Relationship.self(),
        ));
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byKey(messageKey), findsOneWidget);
      },
    );

    testWidgets(
      'Should contain a spinner if the relationship if there is an operation '
      'going on',
      (tester) async {
        when(mockCubit.state).thenReturn(const ProfileState(
          initialized: true,
          user: user,
          relationship: Relationship.stranger(),
          friendOperation: FriendOperation.some(),
        ));
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byType(SpinKitThreeBounce), findsOneWidget);
      },
    );

    testWidgets(
      'Should contain a message if a failure happened',
      (tester) async {
        when(mockCubit.state).thenReturn(const ProfileState(
          initialized: true,
          user: user,
          relationship: Relationship.stranger(),
          friendOperation: FriendOperation.fail(FriendFailure.server()),
        ));
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byKey(messageKey), findsOneWidget);
      },
    );
  });

  group('when Relationship.self()', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: user,
        relationship: Relationship.self(),
      ));
    });

    testWidgets(
      'Should contain Unfriend button',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byIcon(Icons.person_remove), findsOneWidget);
        expect(find.byType(Icon), findsNWidgets(1));
      },
    );

    testWidgets(
      'Clicking the unfriend button should not attempt to unfriend',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        await tester.tap(find.byIcon(Icons.person_remove));
        verifyNever(mockCubit.unfriend(any));
      },
    );
  });

  group('when Relationship.friend()', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: user,
        relationship: Relationship.friend(isOnline: true),
      ));
    });

    testWidgets(
      'Should contain Unfriend button',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byIcon(Icons.person_remove), findsOneWidget);
        expect(find.byType(Icon), findsNWidgets(1));
      },
    );

    testWidgets(
      'Clicking the unfriend button should call cubit.unfriend()',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        await tester.tap(find.byIcon(Icons.person_remove));
        verify(mockCubit.unfriend(any)).called(1);
      },
    );
  });

  group('when Relationship.requestSent()', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: user,
        relationship: Relationship.requestSent(),
      ));
    });

    testWidgets(
      'Should contain a cancel button',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byIcon(Icons.cancel), findsOneWidget);
      },
    );

    testWidgets(
      'Clicking the cancel button should call cubit.cancelFriendRequest()',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        await tester.tap(find.byIcon(Icons.cancel));
        verify(mockCubit.cancelFriendRequest(any)).called(1);
      },
    );
  });

  group('when Relationship.requestReceived()', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: user,
        relationship: Relationship.requestReceived(),
      ));
    });

    testWidgets(
      'Should contain an accept button',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byIcon(Icons.check), findsOneWidget);
      },
    );

    testWidgets(
      'Clicking the accept button should call cubit.answerFriendRequest(true)',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        await tester.tap(find.byIcon(Icons.check));
        verify(mockCubit.answerFriendRequest(any, true)).called(1);
      },
    );

    testWidgets(
      'Should contain a decline button',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        expect(find.byIcon(Icons.cancel), findsOneWidget);
      },
    );

    testWidgets(
      'Clicking the decline button should call '
      'cubit.answerFriendRequest(false)',
      (tester) async {
        final widget = _getWidget();
        await tester.pumpWidget(widget);
        await tester.tap(find.byIcon(Icons.cancel));
        verify(mockCubit.answerFriendRequest(any, false)).called(1);
      },
    );
  });
}
