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

import '../wrappers.dart';

class MockProfileCubit extends Mock implements ProfileCubit {}

void main() {
  const currentUser = User(
    id: 'current_user',
    username: 'current_username',
    name: 'current_name',
  );

  ProfileCubit mockCubit;

  setUp(() {
    mockCubit = MockProfileCubit();
  });

  Widget _getWidget() {
    return BlocProvider<ProfileCubit>(
      create: (_) => mockCubit,
      child: wrapInMaterialSizeConfigApp(Profile()),
    );
  }

  group('User is viewing his own profile', () {
    setUp(() {
      when(mockCubit.state).thenReturn(const ProfileState(
        initialized: true,
        user: currentUser,
        relationship: Relationship.self(),
      ));
    });

    testWidgets(
      'should contain all expected widgets',
      (tester) async {
        // arrange
        final widget = _getWidget();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(ProfilePicture), findsOneWidget);
        expect(find.text('@${currentUser.username}'), findsOneWidget);
        expect(find.text(currentUser.name), findsOneWidget);
        expect(find.byIcon(FontAwesomeIcons.userCheck), findsOneWidget);
        expect(find.byIcon(FontAwesomeIcons.feather), findsOneWidget);
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
}
