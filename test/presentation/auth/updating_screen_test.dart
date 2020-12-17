import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:very_good_chat/application/auth/updating/updating_cubit.dart';
import 'package:very_good_chat/presentation/auth/updating_screen.dart';

import '../widget_wrappers.dart';

class MockUpdatingCubit extends Mock implements UpdatingCubit {}

void main() {
  UpdatingCubit mockCubit;

  setUp(() {
    mockCubit = MockUpdatingCubit();
    when(mockCubit.state).thenReturn(
      const UpdatingState(username: '', name: ''),
    );
  });

  Widget _getWidget() {
    return BlocProvider(
      create: (_) => mockCubit,
      child: wrapInMaterialApp(wrapInMaterial(UpdatingScreen())),
    );
  }

  final registrationState = UpdatingState.initial().copyWith(registering: true);
  final updatingState = UpdatingState.initial().copyWith(
    username: 'username',
    name: 'name',
  );

  group('UpdatingScreen always has 1 ProfileImage and 2 TextFormFields', () {
    testWidgets(
      'While registering',
      (tester) async {
        // arrange
        when(mockCubit.state).thenReturn(registrationState);
        final widget = _getWidget();
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
        when(mockCubit.state).thenReturn(updatingState);
        final widget = _getWidget();
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
      final widget = _getWidget();
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
      when(mockCubit.state).thenReturn(registrationState);
      final widget = _getWidget();
      // render
      await tester.pumpWidget(widget);
      // assert
      expect(find.byType(RegistrationSubmitButton), findsOneWidget);
      expect(find.byType(AppBar), findsNothing);
    },
  );

  group('While updating', () {
    setUp(() {
      when(mockCubit.state).thenReturn(updatingState);
    });

    testWidgets(
      'The page must have an app bar and no submit button',
      (tester) async {
        // arrange
        final widget = _getWidget();
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
        final widget = _getWidget();
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
          updatingState.copyWith(callingApi: true),
        );
        final widget = _getWidget();
        // render
        await tester.pumpWidget(widget);
        // assert
        expect(find.byIcon(Icons.check), findsNothing);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );
  });

  group('UpdatingProfilePicture', () {
    Widget _getWidget(UpdatingState state) {
      return wrapInMaterialApp(
        wrapInMaterial(
          UpdatingProfilePicture(state: state, onEditPressed: () {}),
        ),
      );
    }

    testWidgets(
      'Should always contain an image and an edit button',
      (tester) async {
        // arrange
        final state = UpdatingState.initial();
        final widget = _getWidget(state);
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
        final widget = _getWidget(state);
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
        final widget = _getWidget(state);
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
        final widget = wrapInMaterialApp(
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
        final widget = wrapInMaterialApp(
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
