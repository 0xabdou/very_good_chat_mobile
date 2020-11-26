import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/presentation/auth/updating_screen.dart';

import '../../mock/mock_data.dart';

class MockUpdatingCubit extends Mock implements UpdatingCubit {}

void main() {
  UpdatingCubit mockCubit;

  setUp(() {
    mockCubit = MockUpdatingCubit();
    when(mockCubit.state).thenReturn(
      const UpdatingState(username: '', name: ''),
    );
  });

  Widget _materialApp(Widget widget) {
    return MaterialApp(home: widget);
  }

  Widget _registrationScreen() {
    return _materialApp(
      UpdatingScreen(cubit: mockCubit, authProviderInfo: authProviderInfo),
    );
  }

  Widget _updatingScreen() {
    return _materialApp(
      UpdatingScreen(cubit: mockCubit, currentUser: user),
    );
  }

  group('UpdatingScreen always has 1 ProfileImage and 2 TextFormFields', () {
    testWidgets(
      'While registering',
      (tester) async {
        // arrange
        final widget = _registrationScreen();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(UpdatingProfilePicture), findsOneWidget);
        expect(find.byType(TextFormField), findsNWidgets(2));
      },
    );

    testWidgets(
      'While updating',
      (tester) async {
        // arrange
        final widget = _updatingScreen();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(UpdatingProfilePicture), findsOneWidget);
        expect(find.byType(TextFormField), findsNWidgets(2));
      },
    );
  });

  testWidgets(
    'The text fields should have an initial value',
    (tester) async {
      // arrange
      const name = 'name';
      const username = 'username';
      when(mockCubit.state).thenReturn(
        const UpdatingState(username: username, name: name),
      );
      final widget = _registrationScreen();
      // render
      await tester.pumpWidget(widget);
      // assert
      expect(find.text(name), findsOneWidget);
      expect(find.text(username), findsOneWidget);
    },
  );

  testWidgets(
    'While registering, the page must have a submit button and no app bar',
    (tester) async {
      // arrange
      final widget = _registrationScreen();
      // render
      await tester.pumpWidget(widget);
      // assert
      expect(find.byType(RegistrationSubmitButton), findsOneWidget);
      expect(find.byType(AppBar), findsNothing);
    },
  );

  group('While updating', () {
    testWidgets(
      'The page must have an app bar and no submit button',
      (tester) async {
        // arrange
        final widget = _updatingScreen();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(RegistrationSubmitButton), findsNothing);
        expect(find.byType(AppBar), findsOneWidget);
      },
    );

    testWidgets(
      'if callingApi is false, the action in the appbar should contain a check '
      'mark icon, ant not a spinner',
      (tester) async {
        // arrange
        final widget = _updatingScreen();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byIcon(Icons.check), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
    );

    testWidgets(
      'if callingApi is true , the action in the appbar should contain a '
      'spinner and not a check mark icon',
      (tester) async {
        // arrange
        when(mockCubit.state).thenReturn(
          UpdatingState.initial().copyWith(callingApi: true),
        );
        final widget = _updatingScreen();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byIcon(Icons.check), findsNothing);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );
  });

  group('UpdatingProfilePicture', () {
    testWidgets(
      'Should always contain an image and an edit button',
      (tester) async {
        // arrange
        final state = UpdatingState.initial();
        final widget = _materialApp(
          UpdatingProfilePicture(state: state, onEditPressed: () {}),
        );
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(Image), findsOneWidget);
        expect(find.byIcon(Icons.edit), findsOneWidget);
      },
    );

    testWidgets(
      'Should not contain a spinner when not uploading photo',
      (tester) async {
        // arrange
        final state = UpdatingState.initial();
        final widget = _materialApp(
          UpdatingProfilePicture(state: state, onEditPressed: () {}),
        );
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(CircularProgressIndicator), findsNothing);
      },
    );

    testWidgets(
      'Should contain a spinner when uploading photo',
      (tester) async {
        // arrange
        final state = UpdatingState.initial().copyWith(uploadingPhoto: true);
        final widget = _materialApp(
          UpdatingProfilePicture(state: state, onEditPressed: () {}),
        );
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );
  });

  group('RegistrationSubmitButton', () {
    testWidgets(
      'Should have a check mark icon if not loading',
      (tester) async {
        // arrange
        final widget = _materialApp(
          RegistrationSubmitButton(onPressed: () {}, loading: false),
        );
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byIcon(Icons.check), findsOneWidget);
        expect(find.byType(SpinKitThreeBounce), findsNothing);
      },
    );

    testWidgets(
      'Should have a spinner if loading',
      (tester) async {
        // arrange
        final widget = _materialApp(
          RegistrationSubmitButton(onPressed: () {}, loading: true),
        );
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byType(SpinKitThreeBounce), findsOneWidget);
        expect(find.byIcon(Icons.check), findsNothing);
      },
    );
  });
}
